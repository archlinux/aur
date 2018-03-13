# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfce4-indicator-plugin
_maj=2.3
pkgver=$_maj.4
pkgrel=1
pkgdesc="Plugin to display information from applications in the Xfce4 panel"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/$pkgname"
license=('GPL')
depends=('hicolor-icon-theme'
         'ido'
         'libindicator-gtk2'
         'libindicator-gtk3'
         'xfce4-panel'
         'xdg-utils')
makedepends=('intltool' 'xfce4-dev-tools')
optdepends=('indicator-application-gtk2: take menus from applications and place them in the panel'
            'indicator-sound: unified sound menu')
install=$pkgname.install
source=(http://archive.xfce.org/src/panel-plugins/$pkgname/$_maj/$pkgname-$pkgver.tar.bz2)
sha256sums=('02773722cf99113bc64cc399df47c3a639e206a864c6995be68fe8281076582e')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
