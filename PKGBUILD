# Maintainer: Joe Baldino <pedanticdm@gmx.us>
# Contributor: Vladimir Panteleev <arch-pkg at thecybershadow.net>
pkgname=vc-dwim
pkgver=1.10
pkgrel=1
pkgdesc="GNU utilities for version control and maintaining changelog files"
arch=('any')
url="https://www.gnu.org/software/vc-dwim/"
license=('GPL3')
depends=('perl')
optdepends=('bzr: Bazaar ChangeLogs'
            'cvs: CVS ChangeLogs'
            'darcs: Darcs ChangeLogs'
            'git: Git ChangeLogs'
            'mercurial: Mercurial ChangeLogs'
            'subversion: Subversion ChangeLogs')
source=(https://ftp.gnu.org/gnu/vc-dwim/vc-dwim-${pkgver}.tar.xz{,.sig})
sha256sums=('f06662720c1eae023fd82d03b79aa68d6c0f466a593ef01edfa2cedd7a57a62a'
            'SKIP')
validpgpkeys=('155D3FC500C834486D1EEA677FD9FCCB000BEEEE')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
