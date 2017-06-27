# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gpgit
pkgver=2.0.7
pkgrel=1
pkgdesc="A Python script that automates the process of signing Git sources via GPG"
arch=('any')
url="https://github.com/NicoHood/gpgit"
license=('MIT')
depends=('gnupg' 'git' 'python' 'python-pygithub' 'python-gitpython' 'python-gnupg')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}.tar.xz.asc::https://github.com/NicoHood/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz.asc")
sha512sums=('8571176f883d51859f0e25fe037be0dc70a0d9b6d719305fbc9cc858a752263c1fcaac908dd89d5ff3094704a85f463e839a436bd3b66eb33653aca93280cbd2'
            'SKIP')
# NicoHood <archlinux {cat} nicohood {dog} de>
validpgpkeys=('97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161')

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
    install -Dm 644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
