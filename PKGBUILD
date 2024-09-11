# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>
# Contributor: Allen Li <darkfeline@felesatra.moe>
# Contributor: Fortunato Ventre (voRia) <vorione AT gmail DOT com>

pkgname=bd-git
_pkgname=bd
pkgver=v1.03.r2.g4277ad8
pkgrel=1
pkgdesc='Quickly go back to a parent directory instead of typing "cd ../../.." repeatedly'
url='https://github.com/vigneshwaranr/bd'
arch=('any')
license=('MIT')
makedepends=('git')
depends=('bash')
provides=('bd')
conflicts=('bd')
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

package() {
  cd "${_pkgname}"

  install -D -m 755 bd "$pkgdir/usr/bin/bd"
  install -D -m 644 bash_completion.d/bd "$pkgdir/usr/share/bash-completion/completions/bd"
  install -D -m 644 README.md "$pkgdir/usr/share/doc/bd/README.md"
  install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
