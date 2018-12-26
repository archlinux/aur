# Maintainer: Allen Li <darkfeline@felesatra.moe>
# Contributor: Fortunato Ventre (voRia) <vorione AT gmail DOT com>

pkgname=bd-git
_gitname=bd
pkgver=r41.8b04657
pkgrel=1
pkgdesc="Jump back to a specific directory, without doing `cd ../../..`"
arch=('any')
url="https://github.com/vigneshwaranr/bd"
license=('MIT')
makedepends=('git')
depends=('bash')
optdepends=('bash-completion')
source=($pkgname'::git+git://github.com/vigneshwaranr/bd.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m 755 bd "$pkgdir/usr/bin/bd"
  install -D -m 644 bash_completion.d/bd "$pkgdir/usr/share/bash-completion/completions/bd"
  install -D -m 644 README.md "$pkgdir/usr/share/doc/bd/README.md"
  install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
