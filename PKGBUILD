# Maintainer: Johannes Lange (<firstname>DOT<lastname>ATcern.ch>)
pkgname=cernbox
pkgver=3.2.1_10562
pkgrel=1
pkgdesc="Synchronization client for CERN's CERNBox cloud service (based on ownCloud). Note: CERN IT does not provide official support for Arch Linux. Use at your own risk."
arch=('x86_64')
url="http://cernbox.web.cern.ch/"
license=('GPL')
depends=('qtkeychain')
optdepends=('cernbox-nemo: Nemo integration')
provides=('ocsync' 'cernboxsync')

_repo='https://cernbox.cern.ch/cernbox/doc/Linux/repo/repo.3.2.1/Fedora_37/'
source=(
    ${_repo}cernbox-client-${pkgver/_/-}.x86_64.rpm
    ${_repo}libcernboxsync0-${pkgver/_/-}.x86_64.rpm
)
md5sums=('78519c34217c8f62103d3f99ad74613b'
         '212f70ae1a6deaccc8e1c6877acc6bb7')

package() {
    mkdir -p "${pkgdir}/usr"
    cp -dpr "${srcdir}/usr/share" "${pkgdir}/usr/"
    cp -r "${srcdir}/opt/ownCloud/cernbox/bin" "${pkgdir}/usr/"
    cp -r "${srcdir}/opt/ownCloud/cernbox/lib64" "${pkgdir}/usr/lib"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    cp "${pkgdir}/usr/share/icons/hicolor/128x128/apps/cernbox.png" "${pkgdir}/usr/share/pixmaps"

    cp -dpr "${srcdir}/etc" "${pkgdir}"
}
