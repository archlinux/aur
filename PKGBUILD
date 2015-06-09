# Maintainer: willemw <willemw12@gmail.com>

_pkgname=theyoke
pkgname=$_pkgname-git
pkgver=r23.aa04319
pkgrel=1
pkgdesc="Ultra-simple, polite RSS aggregrator for the command line"
arch=('any')
url="http://github.com/mackers/theyoke/"
license=('GPL' 'PerlArtistic')
depends=('perl-libwww' 'perl-html-parser' 'perl-uri' 'perl-xml-feed' 'perl-digest-md5' 'perl-encode' 'perl-term-size' 'perl-html-format')
makedepends=('git')
conflicts=($_pkgname)
provides=($_pkgname)
source=($pkgname::git://github.com/mackers/theyoke.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  install -Dm755 scripts/theyoke "$pkgdir/usr/bin/theyoke"
  install -Dm644 README "$pkgdir/usr/share/theyoke/README"
}

