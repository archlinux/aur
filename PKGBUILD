# Maintainer: Alastair Pharo  asppsa at gmail dot com

pkgname=emacs-pure-mode
pkgver=0.64
pkgrel=1
pkgdesc="An Emacs major mode for the Pure programming language"
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=("emacs" "pure")
groups=(pure-complete pure-base)
source=("https://bitbucket.org/purelang/pure-lang/downloads/pure-$pkgver.tar.gz")
md5sums=('399b0a5cb6bbf0042ce42f9a857e332e')

build() {
  cd $srcdir/pure-$pkgver
  ./configure --prefix=/usr
}

package() {
  cd $srcdir/pure-$pkgver
  make DESTDIR=$pkgdir install-el install-elc
}
