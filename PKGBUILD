# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=mate-layouts
pkgver=0.0.7
pkgrel=1
pkgdesc="a simple panel layout switching application for the MATE Desktop"
arch=('any')
url="https://github.com/FreaxMATE/$pkgname"
license=('GPL3')
depends=('gtk3' 'libnotify' 'mate-applets' 'python-configobj' 'python-gobject' 'python-psutil' 'python-setproctitle' 'python-distro')
makedepends=('meson' 'python-distutils-extra' 'python-setuptools')
optdepends=('brisk-menu: for Manjaro panel layout'
            'mate-applet-dock: for Mutiny panel layout'
            'mate-menu: to enable advanced menu'
            'mate-netbook: for Netbook panel layout'
            'plank: for Cupertino panel layout'
            'vala-panel-appmenu-mate: for Mutiny,Cupertino')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreaxMATE/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('f2edc542a088e0929cfe4696f5674447f3a5a4479954db1ee8ccd741b7ed64cd8332f92c7c9d55b885772716b50ec2757c20bbf33865f5b5cb9989375b42809e')

build() {
  cd "$pkgname-$pkgver"
  meson --prefix=/usr build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja install -C build
}

