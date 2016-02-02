# Maintainer: Seb Wilzbach < seb at wilzbach dot me >
pkgname=seqtk-git
_pkgname=seqtk
pkgver=r85.4feb6e8
pkgrel=1
pkgdesc="Toolkit for processing sequences in FASTA/Q formats"
arch=('any')
url="https://github.com/lh3/seqtk"
license=('MIT')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=('seqtk')
replaces=()
backup=()
options=()
install=
source=("${_pkgname}::git+${url}")
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'


build() {
 cd "${srcdir}/${_pkgname}"
  # BUILD
  make
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
	#DESTDIR="$pkgdir/" make install
	exec_dir=${pkgdir}/usr/bin/
  mkdir -p ${exec_dir}
  cp seqtk ${exec_dir}	
  cp trimadap ${exec_dir}	
}

# vim:set ts=2 sw=2 et:
