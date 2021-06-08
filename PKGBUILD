# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=piwigo-import-tree-git
_pkgname=piwigo_import_tree
pkgver=r3.5fa9c8b
pkgrel=1
pkgdesc="Perl script to import a tree of image albums into Piwigo"
arch=('any')
url="https://github.com/linux-wizard/piwigo_import_tree"
license=('unlicense')
depends=('perl-json')
provides=('piwigo-import-tree')
conflicts=('piwigo-import-tree')
source=("git+https://github.com/linux-wizard/piwigo_import_tree")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 piwigo_import_tree.pl ${pkgdir}/usr/bin/piwigo_import_tree.pl
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkg_name}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkg_name}/LICENSE
}
