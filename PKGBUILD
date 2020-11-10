# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gpgit
pkgver=1.3.4
pkgrel=1
epoch=1
pkgdesc="A shell script that automates the process of signing Git sources via GPG"
arch=('any')
url="https://github.com/NicoHood/gpgit"
license=('MIT')
depends=('bash' 'gnupg' 'git' 'xz')
optdepends=('jq: Github API upload'
            'curl: Github API upload'
            'lzip: Compression option')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}.tar.xz.asc::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz.asc")
sha512sums=('3cf1ad4ff13f8183a97bd7a7b13fc47ecdbc6c4ac28777e5b29f83dfa27a9d0dba75386082cc31298976b8cbc18f21d9f0e79bcb0e11a898669a2d9644e984d4'
            'SKIP')
# NicoHood <archlinux {cat} nicohood {dog} de>
validpgpkeys=('97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161')

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
    install -Dm 644 "${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
