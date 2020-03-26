# Maintainer: willemw <willemw12@gmail.com>
# Contributor: LinRs <20455421+LinRs AT users.noreply.github.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph 'delmonico' Neuroth <delmonico@gmx.net>

pkgname=snownews
pkgver=1.6.10
pkgrel=3
pkgdesc="RSS feed reader for the command-line"
arch=('x86_64')
url="https://github.com/kouya/snownews"
license=('GPL3')
depends=('libxml2' 'ncurses' 'perl-file-path' 'perl-http-message' 'perl-libwww' 'perl-xml-libxml')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('8c78067aef75e283df4b3cca1c966587b6654e9e84a3e6e5eb8bdd5829799242')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|~/.snownews/url |~/.snownews/urls |' opml2snow
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix="$pkgdir/usr"
  make
}

package() {
  cd $pkgname-$pkgver
  make install
}

