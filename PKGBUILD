
# Contributer: Paramvir Likhari <plikhari at gmail dot com>
# Maintainer: Paramvir Likhari <plikhari at gmail dot com>

pkgname=conkywx
pkgver=200730
pkgrel=1
pkgdesc='To display weather from multiple sources using conky'
arch=('i686' 'x86_64')
url='https://bitbucket.org/plikhari/conkywx_pub/downloads'
license=('GPL3')
depends=( wget perl )
source=(${url}/${pkgname}_${pkgver}.tar.xz)
md5sums=('72b489c1530cf02f4f33c7ef784ff128')
_conkyvar='usr/share/conkywx'


build() {
    cd ${srcdir}/${pkgname}_${pkgver}/lib/magellan_source/
    make
}


package()
{
    cd ${srcdir}/${pkgname}_${pkgver}

    # install script
    install -D -m755 conkywx.bin ${pkgdir}/usr/bin/conkywx
    install -D -m755 ./lib/wxmp.bin ${pkgdir}/usr/bin/wxmp
    install -D -m755 ./lib/wxrss.bin ${pkgdir}/usr/bin/wxrss
     
    mkdir -p ${pkgdir}/${_conkyvar}/examples
    mkdir -p ${pkgdir}/${_conkyvar}/lib
    mkdir -p ${pkgdir}/${_conkyvar}/lib/wxPP
    mkdir -p ${pkgdir}/${_conkyvar}/lib/wxDate
    mkdir -p ${pkgdir}/${_conkyvar}/images/daynight
    mkdir -p ${pkgdir}/${_conkyvar}/images/lua_clock
    mkdir -p ${pkgdir}/${_conkyvar}/images/lua_windvane
    mkdir -p ${pkgdir}/${_conkyvar}/images/windrose-1
    mkdir -p ${pkgdir}/${_conkyvar}/images/wxicons-5
    mkdir -p ${pkgdir}/${_conkyvar}/images/moonicons
    mkdir -p ${pkgdir}/${_conkyvar}/images/wxicons-2
    mkdir -p ${pkgdir}/${_conkyvar}/images/wxicons-4
    mkdir -p ${pkgdir}/${_conkyvar}/images/wxicons-1
    mkdir -p ${pkgdir}/${_conkyvar}/images/wxicons-6
    mkdir -p ${pkgdir}/${_conkyvar}/images/wxicons-7
    mkdir -p ${pkgdir}/${_conkyvar}/images/windrose-3
    mkdir -p ${pkgdir}/${_conkyvar}/images/windrose-2
    mkdir -p ${pkgdir}/${_conkyvar}/images/wxicons-3
    mkdir -p ${pkgdir}/${_conkyvar}/images/bgrounds
    mkdir -p ${pkgdir}/${_conkyvar}/help
    mkdir -p ${pkgdir}/${_conkyvar}/lang
    mkdir -p ${pkgdir}/usr/share/fonts/TTF/conkywx
    mkdir -p ${pkgdir}/usr/share/applications

    install -D -m755 conkywx.sh ${pkgdir}/${_conkyvar}/
    install -D -m755 conky-restart.sh ${pkgdir}/${_conkyvar}/
    install -D -m755 run-conkywx.sh ${pkgdir}/${_conkyvar}/
    install -D -m644 stations.txt ${pkgdir}/${_conkyvar}
     
    install -D -m644 examples/* ${pkgdir}/${_conkyvar}/examples/
    install -D -m644 lib/*.pl ${pkgdir}/${_conkyvar}/lib/
    install -D -m644 lib/*.pm ${pkgdir}/${_conkyvar}/lib/
    install -D -m755 lib/*.lua ${pkgdir}/${_conkyvar}/lib/
    install -D -m755 lib/*.sh ${pkgdir}/${_conkyvar}/lib/
    install -D -m755 lib/magellan_source/magellan ${pkgdir}/${_conkyvar}/lib/
    install -D -m755 lib/wxDate/*.pm ${pkgdir}/${_conkyvar}/lib/wxDate/
    install -D -m644 lib/wxPP/* ${pkgdir}/${_conkyvar}/lib/wxPP/
    install -D -m644 images/daynight/* ${pkgdir}/${_conkyvar}/images/daynight/
    install -D -m644 images/lua_clock/* ${pkgdir}/${_conkyvar}/images/lua_clock/
    install -D -m644 images/lua_windvane/* ${pkgdir}/${_conkyvar}/images/lua_windvane/
    install -D -m644 images/windrose-1/* ${pkgdir}/${_conkyvar}/images/windrose-1/
    install -D -m644 images/wxicons-5/* ${pkgdir}/${_conkyvar}/images/wxicons-5/
    install -D -m644 images/moonicons/* ${pkgdir}/${_conkyvar}/images/moonicons/
    install -D -m644 images/wxicons-2/* ${pkgdir}/${_conkyvar}/images/wxicons-2/
    install -D -m644 images/wxicons-4/* ${pkgdir}/${_conkyvar}/images/wxicons-4/
    install -D -m644 images/wxicons-1/* ${pkgdir}/${_conkyvar}/images/wxicons-1/
    install -D -m644 images/wxicons-6/* ${pkgdir}/${_conkyvar}/images/wxicons-6/
    install -D -m644 images/wxicons-7/* ${pkgdir}/${_conkyvar}/images/wxicons-7/
    install -D -m644 images/windrose-3/* ${pkgdir}/${_conkyvar}/images/windrose-3/
    install -D -m644 images/windrose-2/* ${pkgdir}/${_conkyvar}/images/windrose-2/
    install -D -m644 images/wxicons-3/* ${pkgdir}/${_conkyvar}/images/wxicons-3/
    install -D -m644 images/bgrounds/* ${pkgdir}/${_conkyvar}/images/bgrounds/
    install -D -m644 help/* ${pkgdir}/${_conkyvar}/help/
    install -D -m644 lang/* ${pkgdir}/${_conkyvar}/lang/
    install -D -m644 fonts/* ${pkgdir}/usr/share/fonts/TTF/conkywx/
    install -D -m644 examples/wxmp.desktop ${pkgdir}/usr/share/applications

    # install man page
    gzip -c -9 conkywx.1 > conkywx.1.gz
    install -D -m644 conkywx.1.gz ${pkgdir}/usr/share/man/man1/conkywx.1.gz

}
