# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=mate-layouts
pkgver=0.1.0
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
sha512sums=('40c65372315e5fc90a9bb5712611f851b0496c93ea263e4319b64caa3825244af091b7b9317c50b2a24cad689009bf97120a954de08a842f7226e3d5cc5a6a9e')

build() {
  cd "$pkgname-$pkgver"
  meson --prefix=/usr build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja install -C build
}

