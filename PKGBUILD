# contributed by fenugrec 2018/11
# TODO : optdepends for building docs ?

# The author calls this 'AS' but names his Debian package 'asl'.
# Unfortunately there's an old, unrelated 'asl' package in AUR,
# and 'as' would clash with "GNU AS", therefore this is 'mas'.

pkgname=mas
pkgver=1.42b138
_pkgfilebase=asl-current
_pkgfile=${_pkgfilebase}-142-bld138
pkgrel=1

pkgdesc="Macro cross-assembler (asl) for various processors and microcontrollers."
arch=("i686" "x86_64")
url='http://john.ccac.rwth-aachen.de:8000/as/'
license=('GPL2')

source=("http://john.ccac.rwth-aachen.de:8000/ftp/as/source/c_version/${_pkgfile}.tar.bz2"
				"Makefile.def")

sha256sums=('903510cff70ba134a357b00e3e00f69473ebd53ade903ec91fb5d3fc61facf32'
            '5368cc58e2c4bb5009ded7ce4db1b740a5ebf82943cd44426290e29e165d7db4')

prepare() {
	cd "${_pkgfilebase}"
	cp ../Makefile.def .
}

build() {
	cd "${_pkgfilebase}"
	make
}


package() {
	cd "${_pkgfilebase}"
	make DESTDIR="$pkgdir" install
}
