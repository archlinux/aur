pkgname=lnkedit
pkgver=1.1
pkgrel=2
pkgdesc="Command line editor of Windows shortcuts (.lnk files)"
arch=('i686' 'x86_64')
url="http://iain.cx/src/lnkedit/"
license=('custom')

depends=('wine')

source=("http://iain.cx/src/lnkedit/${pkgname}-${pkgver}.zip"
        "${pkgname}.patch")
sha1sums=('3e11d05032772739b5ced89cbad20a668d112d98'
          'b4aafc9c9816d45e18c6949886039d00ef53f95c')

prepare () {
    cd ${srcdir}/${pkgname}-${pkgver}/src
    patch < ${srcdir}/${pkgname}.patch
}

build () {
    cd ${srcdir}/${pkgname}-${pkgver}/src
    make
}

package() {
    install -Dm755 ${srcdir}/${pkgname}-${pkgver}/src/${pkgname}.exe ${pkgdir}/usr/bin/${pkgname}
    install -Dm755 ${srcdir}/${pkgname}-${pkgver}/src/${pkgname}.exe.so ${pkgdir}/usr/bin/${pkgname}.exe.so
}

# vim:set ts=2 sw=2 et:
