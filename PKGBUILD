# Maintainer: Francesco Cherchi <francesco.cherchi@protonmail.com>
# Contributor: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=xdgmenumaker
pkgver=1.6
pkgrel=2
pkgdesc="A command line tool that generates XDG menus for several window managers"
url="https://github.com/gapan/$pkgname"
arch=('any')
license=('GPL3')
depends=('python-pyxdg' 'python-gobject' 'gtk3')
optdepends=('txt2tags: for manpages' 'python-pillow: for restricting icon size')
source=("${pkgname}-${pkgver}::https://github.com/gapan/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('4194aaa4074d938a54d0c9c853c0b4e1')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

