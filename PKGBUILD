# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=mate-layouts
pkgver=0.0.4
pkgrel=1
pkgdesc="a simple panel layout switching application for the MATE Desktop"
arch=('any')
url="https://github.com/FreaxMATE/$pkgname"
license=('GPL3')
depends=('gtk3' 'libnotify' 'mate-applets' 'python-configobj' 'python-gobject' 'python-psutil' 'python-setproctitle' 'python-distro')
makedepends=('python-distutils-extra' 'python-setuptools')
optdepends=('brisk-menu: for Manjaro panel layout'
            'mate-applet-dock: for Mutiny panel layout'
            'mate-menu: to enable advanced menu'
            'mate-netbook: for Netbook panel layout'
            'plank: for Cupertino panel layout'
            'vala-panel-appmenu-mate: for Mutiny,Cupertino')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreaxMATE/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('e620014ad28257ae4f09ac425054922a419b91634b15ab070f88e5ce8e18241a7a443729bf5eee8194d1a4a0ae7cfe615b8c7908208930daa5be888f3d2c16e8')

build() {
  cd "$pkgname-$pkgver"
  meson --prefix=/usr build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja install -C build
}

