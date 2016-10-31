# Maintainer: Emmanuel Gil Peyrot <emmanuel.peyrot@collabora.com>

_pkgname=clang-format-linter
pkgname=$_pkgname-git
pkgver=r12.d66020b
pkgrel=1
pkgdesc='clang-format linter for Phabricator (via arcanist)'
arch=('any')
url='https://github.com/vhbit/clang-format-linter'
license=('BSD3')
source=('git+https://github.com/vhbit/clang-format-linter')
provides=('clang-format-linter')
conflicts=('clang-format-linter')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -dm755 "$pkgdir/usr/share/php/$_pkgname"
  install -Dm644 __phutil_library_init__.php  __phutil_library_map__.php "$pkgdir/usr/share/php/$_pkgname/"
  install -Dm644 lint/linter/ClangFormatLinter.php "$pkgdir/usr/share/php/$_pkgname/lint/linter/ClangFormatLinter.php"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
