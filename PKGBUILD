# Maintainer: Sergey Kostyaev <feo.me@ya.ru>
pkgname=wrangler
pkgver=20160511
pkgrel=1
pkgdesc="Wrangler -- An Erlang Refactorer"
arch=('i686' 'x86_64')
url="https://www.cs.kent.ac.uk/projects/wrangler/Wrangler/Home.html"
license=('BSD-new')
depends=('erlang' 'emacs')
source=($pkgname::git+https://github.com/RefactoringTools/wrangler.git)
md5sums=('SKIP')


pkgver() {
  cd $pkgname
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
