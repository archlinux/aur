# Maintainer: LinRs <20455421+LinRs AT users.noreply.github.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph 'delmonico' Neuroth <delmonico@gmx.net>

pkgname=snownews
pkgver=1.6.10
pkgrel=2
pkgdesc="Text mode RSS newsreader for Linux and Unix."
arch=('x86_64')
url="https://github.com/kouya/snownews"
license=('GPL3')
depends=('libxml2' 'ncurses' 'perl-xml-libxml' 'perl-xml-libxslt')
optdepends=('gettext')
source=("${pkgname}-${pkgver}".tar.gz::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('8c78067aef75e283df4b3cca1c966587b6654e9e84a3e6e5eb8bdd5829799242')
build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=./usr
  make
}
package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="./usr" install
  cp -R ./usr $pkgdir/
}
