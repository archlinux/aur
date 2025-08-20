# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: João Freitas <joaj.freitas at gmail dot com>
pkgname=plotjuggler
pkgver='3.10.9'
pkgrel=1
epoch=
pkgdesc="The Time Series Visualization Tool that you deserve. Without ROS dependencies."
arch=('x86_64')
url="https://github.com/facontidavide/PlotJuggler"
license=('MPL-2.0')
groups=()
depends=(binutils qt5-base qt5-multimedia qt5-svg qt5-websockets qt5-x11extras zeromq)
makedepends=(cmake clang)

_dir="PlotJuggler-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/facontidavide/PlotJuggler/archive/${pkgver}.tar.gz" "plotjuggler3.10.9-1.patch")
noextract=()
validpgpkeys=()

prepare() {
    patch -d PlotJuggler-$pkgver -Np1 -i "$srcdir/plotjuggler3.10.9-1.patch"
    cd "${srcdir}/PlotJuggler-${pkgver}"
}

build() {
        # Create the build directory.
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
        cd ${srcdir}/build

	cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ${srcdir}/${_dir}
	make
}

package() {
        cd ${srcdir}/build
	make DESTDIR=${pkgdir} install
}
sha512sums=('fa669f80362976a3d3db57e6bf9e285483c671bf9fcd6a780502fec508e39fc2960d515c8fbe48d905eaa13864539a1c3fbe166f8addac48cd860b0c599a460a'
            'b625fd2725d316244ee6f35af9559a04e9c486d27a377a49c39c204ced194a13ac656782637824f9375449a2bc11e9f1f5d7fefb3a8e41a3232369c2a60af5ec'
            '6e4d954b93435dcd19e06e3f328818569864810e409b877889c27ea86840c02e451a9a80c81ddb18af7d20e440f593ba8561fb0a7c3b14ebebcf6ca5060fa252'
            'eaf3143ac69c6ad311e1d4289de5c48a6e7cf721870ae279c8fff7c6f9a573fcdbc62eaacca1bbff7db97a00dbac59ead9c2baf68c8c8671708595784571d9da')
sha512sums=('4f46d017640aeedc83b61298ebf031de961510d11c84e1293c9f221c593b36ba06d961952ede1516b2de5ef2273087e5331ecbdf427f8cc78c40d25460d4fbe1'
            'dbdf4984c325f6be02e2878d975a14dcf7403c0ed4577d070af336519484621bdbc3e84e05dc99b60b6d147a724b6fc65e67a0d275edef92b49e897db272d7af')
sha512sums=('4f46d017640aeedc83b61298ebf031de961510d11c84e1293c9f221c593b36ba06d961952ede1516b2de5ef2273087e5331ecbdf427f8cc78c40d25460d4fbe1'
            '255e5f5444b9ffc5f1b3d8e4ace792fb600cf7d47cc933121cc9355a4f445257137da31c604c66053c1b3d3ea193433fed280f89d8dffc9205435e38dbd3223d')
