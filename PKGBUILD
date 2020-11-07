# contributed by fenugrec 2018/11
# note : this only compiles the minimum amount of docs.

# The author calls this 'AS' but names his Debian package 'asl'.
# Unfortunately there's an old, unrelated 'asl' package in AUR,
# and 'as' would clash with "GNU AS", therefore this is 'mas'.
#

pkgname=mas
pkgver=1.42b178
_pkgfilebase=asl-current
_pkgfile=${_pkgfilebase}-142-bld178
pkgrel=1
pkgdesc="Macro cross-assembler (asl) for various processors and microcontrollers."
arch=("i686" "x86_64")
url='http://john.ccac.rwth-aachen.de:8000/as/'
license=('GPL2')

#required for full docs
#makedepends=('texlive-core')

source=("http://john.ccac.rwth-aachen.de:8000/ftp/as/source/c_version/${_pkgfile}.tar.bz2"
				"Makefile.def"
				"makefile_nodocs.patch")

sha256sums=('cb3740a96be117719b1a4b8de2bc02a84146898ee774de5cf3e0b352275209b2'
            '0507795f2558bff086bc3d88169529a6dba5fe6cf4731433eb1388b421fa6d9f'
            '67c5d45388250f030c0cf5dfa4c18bec0f55aa2d5ae9b21875d32b0167d3e9d7')

prepare() {
	cd "${_pkgfilebase}"
	cp ../Makefile.def .
	patch -i ../makefile_nodocs.patch
}

build() {
	cd "${_pkgfilebase}"
	make
}


package() {
	cd "${_pkgfilebase}"
	make DESTDIR="$pkgdir" install
}
sha256sums=('cb3740a96be117719b1a4b8de2bc02a84146898ee774de5cf3e0b352275209b2'
            '0507795f2558bff086bc3d88169529a6dba5fe6cf4731433eb1388b421fa6d9f'
            '67c5d45388250f030c0cf5dfa4c18bec0f55aa2d5ae9b21875d32b0167d3e9d7')
