# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gpgit
pkgver=1.1.2
pkgrel=1
pkgdesc="A shell script that automates the process of signing git sources via gpg "
arch=('any')
url="https://github.com/NicoHood/gpgit"
license=('MIT')
depends=('bash' 'gnupg' 'git' 'coreutils' 'grep')
optdepends=('wget: online source verification'
            'curl: Github uploading'
            'gzip: compression algorithm'
            'xz: compression algorithm'
            'lzip: compression algorithm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/NicoHood/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('69363d778d861347b67b76d17614e90f4595ee106017a80285daecdd4e8e35175fe349db636bafa8b87cfaf2bad4ff586cbbc7cf6df4184af4ae9419199a31d7'
            'SKIP')
validpgpkeys=('97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161') # NicoHood <archlinux {cat} nicohood {dog} de>

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
    install -Dm 644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
