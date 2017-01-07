# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gpgit
pkgver=1.0.0
pkgrel=1
pkgdesc="A shell script that automates the process of signing git sources via gpg "
arch=('any')
url="https://github.com/NicoHood/gpgit"
license=('MIT')
depends=('gnupg' 'git' 'bash')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}.tar.xz.sig::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz.sig")
sha512sums=('9b695e61e007a52e889e21f3145ab4aaca324615fe6eb2448d8bffbf09fa0b71ea2e3dbb8c0ff64f8f0a6531294d0ed65393412622b6330214636bacdb884fd6'
            'SKIP')
validpgpkeys=('97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161') # NicoHood <archlinux {cat} nicohood {dog} de>

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
    install -Dm 644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
