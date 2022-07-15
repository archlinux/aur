# Maintainer: Francesco Cherchi <francesco.cherchi@protonmail.com>
# Contributor: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=xdgmenumaker
pkgver=2.0
pkgrel=1
pkgdesc="A command line tool that generates XDG menus for several window managers"
url="https://github.com/gapan/${pkgname}"
arch=('any')
license=('GPL3')
depends=('python-pyxdg' 'python-gobject' 'gtk3')
optdepends=('txt2tags: for manpages' 'python-pillow: for restricting icon size')
source=("${pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz")
md5sums=('ee9111404d96e0ec086db69fbf0ae48f')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

