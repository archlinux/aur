# Contributor: T.Cunly
#
# This is based on PKGBUILD linked at https://hep.pa.msu.edu/wiki/bin/view/T2K/ArchInstallCERNLIB
#
# Maintainer of cernlib: Chan Beom Park <cbpark@gmail.com>
# Maintainer: QIN Yuhao <qinq_net@buaa.edu.cn>

_pkgbasename=cernlib
pkgname=lib32-cernlib
pkgver=2006_35
pkgrel=3
_pkgver=2006-35
_atlasver=3.8.4-1
_atlascppver=0.6.2-1
pkgdesc="A large collection of general purpose libraries and modules maintained and offered in both source and object code form on the CERN central computers."
arch=('x86_64')
url="http://cernlib.web.cern.ch/cernlib"
license=('GPL')
depends=(openmotif gcc-fortran lapack lib32-libxp cernlib)
    _rpmarch=i686
    URLROOT=http://archives.fedoraproject.org/pub/archive/fedora/linux/releases/16/Everything/x86_64/os/Packages
    source=($URLROOT/cernlib-${_pkgver}.fc14.${_rpmarch}.rpm \
#            $URLROOT/cernlib-static-${_pkgver}.fc14.${_rpmarch}.rpm \
#            $URLROOT/cernlib-utils-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/cernlib-devel-${_pkgver}.fc14.${_rpmarch}.rpm \
#            $URLROOT/cernlib-packlib-2006-33.fc12.${_rpmarch}.rpm  \
#            $URLROOT/cernlib-packlib-gfortran-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/atlas-sse-${_atlasver}.fc16.${_rpmarch}.rpm  \
            $URLROOT/atlas-sse-devel-${_atlasver}.fc16.${_rpmarch}.rpm \
            $URLROOT/atlascpp-${_atlascppver}.fc16.${_rpmarch}.rpm \
            $URLROOT/atlascpp-devel-${_atlascppver}.fc16.${_rpmarch}.rpm  \
            $URLROOT/xbae-4.60.4-13.fc15.${_rpmarch}.rpm \
#            $URLROOT/kuipc-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/g2clib-devel-1.2.2-2.fc16.${_rpmarch}.rpm \
            $URLROOT/compat-libf2c-34-3.4.6-22.fc15.${_rpmarch}.rpm \
#            $URLROOT/patchy-2006-33.fc12.${_rpmarch}.rpm \
#            $URLROOT/patchy-gfortran-${_pkgver}.fc14.${_rpmarch}.rpm \
#            $URLROOT/paw-gfortran-${_pkgver}.fc14.${_rpmarch}.rpm \
#            $URLROOT/paw-2006-33.fc12.${_rpmarch}.rpm)
    )
    sha256sums=('9c81ea4b261b80dd9afcdd7a18710bdc2efda42f7c72639d4edf26652d8d2b18'
#                'dd30114ea87e8a90807c66568bb0d323853d3c778fbd16e13edef09175bcc843'
#                '96598f5b18d72ae9774b77f2e029822e95534fdd32677cbdfda5e45572a822b0'
                '1333bd68da5cfb47ec3c5b1ffe9d076c0a1916ae06f88779a8aadd2e4bec7dec'
#                '7f590a0e85e5325ae30c44e7094be8b853e260425e0db3686ee56125bca44124'
#                '543e70cfa7209e6be90acad3c8d36415f6b5a59af2e9f611d66b350e0c17ae57'
                'f26a402e50320a8d262399f0527ec1eaf8abd1f0fadd7b51433d30128158e4b7'
                'aff9fd839cd897f359cd660f918699375e488fe3a21ef8a91f3ab8a4104acf05'
		'e65780d6042b1a7d70c2a412cf8325cd1f6bdb7bcbecc8c9f6a8f2d5f2c1fab7'
		'7af716a293c4fee523607eb2bc8427ce23cda6b555c112ce97730318044a58b4'
                '9308250700192b246e8f1dcade59b87eaa97db631061b27535026b8771429e81'
#                '60b764a1a09a3698ec1e6a7bf4105e5d898bf8f18bf6a0d97efe0e218f1571de'
                '3c642d47796ec4b859b853bca4ba72907f4b2fc11ce82f6ba45e53e664b32e8d'
		'b1fffeb7aa9b9fd8bb9712113fcd0c29eebacd57a05f94e24ba164a04d36aca5')
#                '7d6f7199b5e0c9b99bc2f48b32b5a2a0599eacf0d8f4490d29a06f0128c233bc'
#                'eb88c04bc688f1aa4792d50cac22931d0a39a33efc76f22a652879092ee4406d'
#                'ac7356526977e665c5d985f85b8976e547c1ba1d0358af4558cf89bb48df1c0f'
#                '8574c92d59f7e2284f63f05ec2b6f7d87292d7e82ce327b1e65a16939ce7adbd')
prepare() {
    mv -T ${srcdir}/usr/lib ${srcdir}/usr/lib32
}
package() {
    echo '===> removing conflict files'
    rm -rf ${srcdir}/usr/share/cernlib
#    rm -r ${srcdir}/usr/share/man/man1
    rm -rf ${srcdir}/usr/share/aclocal
    rm -rf ${srcdir}/usr/share/doc/cernlib-2006
    rm -rf ${srcdir}/usr/share/doc/g2clib-devel-1.2.2
    rm -rf ${srcdir}/usr/share/doc/cernlib-devel-2006
    rm -rf ${srcdir}/usr/share/doc/xbae-4.60.4
    rm -rf ${srcdir}/usr/include/cernlib
    rm -rf ${srcdir}/usr/include/packlib.h
    rm -rf ${srcdir}/usr/include/grib2.h
    rm -rf ${srcdir}/usr/include/Xbae
    cp -r ${srcdir}/usr $pkgdir
}
