# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=mate-layouts
pkgver=0.0.8
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
sha512sums=('ffd2e6ae4bd22a2a15744fc8bfac252816f19c4bfb301714fb55fa41589c789626fd60e6bf53d7cc732d3b444d5433aae8de4288ee4630890b64dd93f5ae8c04')

build() {
  cd "$pkgname-$pkgver"
  meson --prefix=/usr build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja install -C build
}

