# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=proxsign-bin
pkgver=2.2.8
pkgrel=1
_pkgname=proxsign
_pkgver=2.2.8-1.f35
pkgdesc="SETCCE proXSign® is a set of components for PKI based digital signing. Package based on the official binary build."
arch=('x86_64')
url="https://www.setcce.com/products/electronic-signature-technologies/pki"
license=('custom: SETCCE')
depends=('cairo' 'libjpeg6-turbo' 'libldap24' 'nss' 'xalan-c' 'xerces-c' 'zlib')
provides=('proxsign')
conflicts=('proxsign')
replaces=('proxsign')
source=(https://proxsign.setcce.si/$_pkgname/repo/Fedora_35/x86_64/$_pkgname-$_pkgver.x86_64.rpm)
sha256sums=('eb55067ea243166476ace0f72c99c80e876e1efd51f4f0e2084368a93ec5376f')

package() {
    install -Dm755 ${srcdir}/usr/bin/proxsign ${pkgdir}/usr/bin/proxsign
    install -Dm644 ${srcdir}/etc/proxsign.ini ${pkgdir}/etc/proxsign.ini
    install -Dm644 ${srcdir}/usr/lib64/libpxs-podofo.so ${pkgdir}/usr/lib/libpxs-podofo.so
    install -Dm755 ${srcdir}/usr/lib64/libpxs-podofo.so.0.9.7 ${pkgdir}/usr/lib/libpxs-podofo.so.0.9.7
    install -Dm644 ${srcdir}/usr/share/applications/proxsign.desktop ${pkgdir}/usr/share/applications/proxsign.desktop
    install -Dm644 ${srcdir}/usr/share/icons/hicolor/scalable/apps/proXSign.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/proXSign.svg
}
