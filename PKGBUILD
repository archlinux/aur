# Maintainer: Francesco Cherchi <francesco.cherchi@protonmail.com>
# Contributor: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=xdgmenumaker
pkgver=1.5
pkgrel=1
pkgdesc="A command line tool that generates XDG menus for several window managers"
url="https://github.com/gapan/$pkgname"
arch=('any')
license=('GPLv3')
depends=('pygtk' 'pygobject-devel' 'gobject-introspection' 'python-gobject' 'python-xdg')
optdepends=('txt2tags: for manpages')
source=("https://github.com/gapan/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('fc7d0557da6b23315c8396d388bce6deb85ed76c3ec42f73ae0dc1a5d6a35ecb79015807c136fde4648256a7171c0242f392ebe51b225f7a276d50aaf00586f6')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

