# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=proxsign-bin
pkgver=2.2.8
pkgrel=2
_pkgname=proxsign
_pkgver=2.2.8-1.f34
pkgdesc="SETCCE proXSign® is a set of components for PKI based digital signing. Package based on the official binary build."
arch=('x86_64')
url="https://www.setcce.com/products/electronic-signature-technologies/pki"
license=('custom: SETCCE')
depends=('cairo' 'libjpeg6-turbo' 'libldap24' 'nss' 'xalan-c' 'xerces-c' 'zlib')
provides=('proxsign')
conflicts=('proxsign')
replaces=('proxsign')
source=(https://proxsign.setcce.si/$_pkgname/repo/Fedora_34/x86_64/$_pkgname-$_pkgver.x86_64.rpm)
sha256sums=('ec63a836588babd7e6b0f81b4c4bfb075ede3f3da1f8a0bb3df273bd17b9c28c')

package() {
    install -Dm755 ${srcdir}/usr/bin/proxsign ${pkgdir}/usr/bin/proxsign
    install -Dm644 ${srcdir}/etc/proxsign.ini ${pkgdir}/etc/proxsign.ini
    install -Dm644 ${srcdir}/usr/lib64/libpxs-podofo.so ${pkgdir}/usr/lib/libpxs-podofo.so
    install -Dm755 ${srcdir}/usr/lib64/libpxs-podofo.so.0.9.7 ${pkgdir}/usr/lib/libpxs-podofo.so.0.9.7
    install -Dm644 ${srcdir}/usr/share/applications/proxsign.desktop ${pkgdir}/usr/share/applications/proxsign.desktop
    install -Dm644 ${srcdir}/usr/share/icons/hicolor/scalable/apps/proXSign.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/proXSign.svg
}
