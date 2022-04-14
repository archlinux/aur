# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=mate-layouts
pkgver=0.1.1 
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
sha512sums=('58546dc4469cc1be6cd07ee8f9e9d43cf4ec0bbd9c92addf0b732d3f9a128c704d2ebba5aaec4b2bf08e0ee5bfc09c875737337fa14813d04147bd6c2b9d6f99')

build() {
  cd "$pkgname-$pkgver"
  meson --prefix=/usr build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja install -C build
}

