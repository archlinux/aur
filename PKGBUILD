# Contributor: sergeantspoon <sergeantspoon@archlinux.us>

pkgname=djohn
pkgver=0.9.8.1
pkgrel=1
pkgdesc="Cracks passwords over multiple computers using john"
arch=('i686' 'x86_64')
url="http://ktulu.com.ar/blog/software/djohn/"
license=('GPL')
optdepends=('john: to actually crack passwords')
source=(http://downloads.sourceforge.net/sourceforge/djohn/$pkgname-$pkgver.tgz)
md5sums=('89b6d49033438a86db40418b569dc03e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # build
  make linux || return 1

  # install
  install -d $pkgdir/usr/bin/
  install -s -m 0755 djohn djohnd $pkgdir/usr/bin/
  ln -s djohnd $pkgdir/usr/bin/djs
}
