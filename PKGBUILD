# Maintainer: Lukas Sabota <LTsmooth42 _at_ gmail _dot_ com>
# Contributor: Lukas Sabota <LTsmooth42 _at_ gmail _dot_ com>
pkgname=nesasm-git
_pkgname=nesasm
pkgver=4.b7affbb
pkgrel=1
pkgdesc="Linux port of the NESASM3 assembler."
arch=('x86' 'x86_64')
url="https://github.com/toastynerd/nesasm"
license=('Unknown')
groups=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(${_pkgname}::git+https://github.com/toastynerd/nesasm)
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"
  make

  mkdir -p $pkgdir/usr/bin
  cp bin/nesasm $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
