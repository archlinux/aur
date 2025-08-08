# Maintainer: Ambrus Sümegi <ambrus95@gmail.com>
pkgname=('eszig')
pkgver=2.0.38
pkgrel=1
pkgdesc="eSzemelyi Kliens, Hungarian personal electronic ID card software client"
arch=('x86_64')
license=('custom')
url="https://services.gov.hu/legacy-termekek-szolgaltatasok/eszemelyi-szolgaltatasok"
depends=('pcsclite' 'qt5-base')
source=(https://services.gov.hu/eszemelyi-szolgaltatasok/eSzemelyi-Kliens-${pkgver}-amd64.deb
        https://services.gov.hu/eszemelyi-szolgaltatasok/Vegfelhasznaloi-nyilatkozat-EULA.pdf)
sha256sums=('982c4ff7d71a7128eea63e8373f64a360c76f6c331f8d04b9cb294a8fc67af69'
            '915715868458ebb8a2e102b043e6ee84525c09e22f311b7561a80eb3bbf81009')

package() {
 ar x "${srcdir}/eSzemelyi-Kliens-${pkgver}-amd64.deb"
 tar -C "${pkgdir}" -xJf "${srcdir}/data.tar.xz"

 install -m644 -D "${srcdir}/Vegfelhasznaloi-nyilatkozat-EULA.pdf" \
    "${pkgdir}/usr/share/licenses/eszig/Vegfelhasznaloi-nyilatkozat-EULA.pdf"
}
