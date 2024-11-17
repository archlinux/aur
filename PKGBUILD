# Maintainer: Anton Gnatyuk <dev _at_ ghostnoise _dot_ ru>
# Contributor: Anton Gnatyuk <dev _at_ ghostnoise _dot_ ru>
pkgname=nesasm-clusterm-git
_pkgname=nesasm
pkgver=3.6.084c0cd
pkgrel=1
pkgdesc="ClusterM's fork of Tim Hentenaar's fork of Bob Rost's fork of MagicKit's nesasm 2.51."
arch=('x86' 'x86_64')
url="https://github.com/ClusterM/nesasm"
license=('Unknown')
groups=()
provides=()
conflicts=('nesasm-git')
replaces=()
backup=()
options=(!emptydirs)
install=
source=(${_pkgname}::git+https://github.com/ClusterM/nesasm)
depends=('glibc')
makedepends=('gcc' 'make')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git describe --tags --abbrev=0 --match 'v*' | cut -b2-).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}/source"
  make all

  mkdir -p $pkgdir/usr/bin
  cp ../nesasm $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:

