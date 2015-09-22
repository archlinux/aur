pkgname=yubikey-piv-manager
pkgver=1.0.2
pkgrel=1
pkgdesc="Tool for configuring your PIV-enabled YubiKey."
arch=('i686' 'x86_64')
url="https://developers.yubico.com/yubikey-piv-manager/"
license=('GPL')
depends=('python2' 'yubico-piv-tool' 'python2-pyside' 'python2-crypto')
source="https://developers.yubico.com/yubikey-piv-manager/Releases/yubikey-piv-manager-1.0.2.tar.gz"
md5sums=('1c4fb256a8c0e6b24afe8bb4ed8819f6')

package() {
    cd "${pkgname}-${pkgver}"
    python2 setup.py install --root=${pkgdir}

    mkdir -p ${pkgdir}/usr/share/applications/
    install -D -m0644 ${srcdir}/${pkgname}-${pkgver}/resources/pivman.desktop ${pkgdir}/usr/share/applications/

    mkdir -p ${pkgdir}/usr/share/pixmaps
    install -D -m0644 ${srcdir}/${pkgname}-${pkgver}/resources/pivman.xpm ${pkgdir}/usr/share/pixmaps
}
