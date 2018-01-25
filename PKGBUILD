# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gpgit
pkgver=1.3.0
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
sha512sums=('a5897575c3306a8a5d89ace6d6eae9374bf006c4f61e87a0939025e9cf11379e63480821edb8ae84f8fc7dc05123bed2382968287e5dc754c49843156949aff1'
            'SKIP')
# NicoHood <archlinux {cat} nicohood {dog} de>
validpgpkeys=('97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161')

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
    install -Dm 644 "${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
