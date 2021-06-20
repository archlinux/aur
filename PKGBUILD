# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=piwigo-import-tree-git
_pkgname=${pkgname%-git}
pkgver=r4.252844f
pkgrel=1
pkgdesc="Perl script to import a tree of image albums into Piwigo"
arch=('any')
url="https://github.com/jose1711/piwigo-import-tree"
license=('unlicense')
depends=('perl-json')
provides=('piwigo-import-tree')
conflicts=('piwigo-import-tree')
source=("git+https://github.com/jose1711/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 piwigo_import_tree.pl ${pkgdir}/usr/bin/piwigo_import_tree.pl
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
