# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contrubitor: Juston Li <juston.h.li@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=repo
pkgname=repo-git
pkgver=1.13.7.1.r0.gb466854b
pkgrel=1
pkgdesc="The Multiple Git Repository Tool"
arch=('any')
url="https://source.android.com/source/developing.html"
license=('Apache')
depends=('git' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://gerrit.googlesource.com/git-repo")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -Dm755 repo "$pkgdir"/usr/bin/repo
  install -Dm644 docs/manifest-format.md "$pkgdir"/usr/share/doc/repo/manifest-format.md
}
