# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gpgit
pkgver=1.1.0
pkgrel=1
pkgdesc="A shell script that automates the process of signing git sources via gpg "
arch=('any')
url="https://github.com/NicoHood/gpgit"
license=('MIT')
depends=('bash' 'gnupg' 'git' 'coreutils')
optdepends=('wget: online source verification'
            'gzip: compression algorithm'
            'xz: compression algorithm'
            'lzip: compression algorithm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/NicoHood/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('51f84ba1615d5a0ae1300d569f1e1127903114d8cf9c397f7e0dbd12e3ab3b3b4d31961bd57296750427e9b3ef9c6de1f126011d003c3e9a9e4ce4aa3b608610'
            'SKIP')
validpgpkeys=('97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161') # NicoHood <archlinux {cat} nicohood {dog} de>

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
    install -Dm 644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
