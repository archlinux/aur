# Maintainer: Francesco Cherchi <francesco.cherchi@protonmail.com>
# Contributor: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=xdgmenumaker
pkgver=1.6
pkgrel=1
pkgdesc="A command line tool that generates XDG menus for several window managers"
url="https://github.com/gapan/$pkgname"
arch=('any')
license=('GPL3')
depends=('pygobject-devel' 'gobject-introspection' 'python-gobject' 'python-xdg')
optdepends=('txt2tags: for manpages' 'python-pillow: for restricting icon size')
source=("${pkgname}-${pkgver}::https://github.com/gapan/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('d4715378c198a5f6fe558fbbfdce0cf87485330683aa41075cc42d06fa910472b94e5ffb4a88ff5797a80c126010693855c80c10d9bc06d93286650a0d416448')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

