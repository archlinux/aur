# Maintainer: Ambrus Sümegi <ambrus95@gmail.com>
pkgname=('eszig')
pkgver=1.7.3
_pkgver=$(echo ${pkgver} | sed -r 's/\./_/g')
pkgrel=1
pkgdesc="eSzemelyi Kliens, Hungarian personal electronic ID card software client"
arch=('x86_64')
license=('custom')
url="https://eszemelyi.hu/"
depends=('pcsclite' 'qt5-base')
source=(https://eszemelyi.hu/letoltesek/eSzemelyi_Kliens_x64_${_pkgver}.deb
        https://eszemelyi.hu/wp-content/uploads/2021/09/eSzemelyi_Kliens_vegfelhasznaloi_nyilatkozat_v13.pdf)
sha256sums=('9fd36ac71eb81b057735e86fb872bd8faf9f5299410a82d96d0a793c03928622'
            '518d83d0702051bc7e82f29ccb29504aa14104a0f006a19c3c25b8c78313c5c5')

package() {
 ar x "${srcdir}/eSzemelyi_Kliens_x64_${_pkgver}.deb"
 tar -C "${pkgdir}" -xJf "${srcdir}/data.tar.xz"

 install -m644 -D "${srcdir}/eSzemelyi_Kliens_vegfelhasznaloi_nyilatkozat_v13.pdf" \
    "${pkgdir}/usr/share/licenses/eszig/eSzemelyi_Kliens_vegfelhasznaloi_nyilatkozat_v13.pdf"
}
