# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=('eszig')
pkgver=1.5.19
_pkgver=$(echo ${pkgver} | sed -r 's/\./_/g')
pkgrel=1
pkgdesc="eSzemelyi Kliens, Hungarian personal electronic ID card software client"
arch=('x86_64' 'i586')
license=('custom')
url="https://eszemelyi.hu/"
depends=('pcsclite' 'qt5-base')
source=(https://eszemelyi.hu/app/eSzemelyi_Kliens_x64_${_pkgver}.deb
        https://eszemelyi.hu/dok/eSzemelyi_Kliens_vegfelhasznaloi_nyilatkozat_v10.pdf)
sha256sums=('5a0ba682d39c1681a72668ee52b060f970d333cf1600850b776943229034bd79'
            '4670589538ea4d86d02fec2565653a36c2bfb4bc09751c1b7a3548def176a9da')

package() {
 ar x "${srcdir}/eSzemelyi_Kliens_x64_${_pkgver}.deb"
 tar -C "${pkgdir}" -xJf "${srcdir}/data.tar.xz"

 install -m644 -D "${srcdir}/eSzemelyi_Kliens_vegfelhasznaloi_nyilatkozat_v10.pdf" \
    "${pkgdir}/usr/share/licenses/eszig/eSzemelyi_Kliens_vegfelhasznaloi_nyilatkozat_v10.pdf"
}
