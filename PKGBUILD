# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=('eszig')
pkgver=1.6.30
_pkgver=$(echo ${pkgver} | sed -r 's/\./_/g')
pkgrel=2
pkgdesc="eSzemelyi Kliens, Hungarian personal electronic ID card software client"
arch=('x86_64')
license=('custom')
url="https://eszemelyi.hu/"
depends=('pcsclite' 'qt5-base')
source=(https://eszemelyi.hu/letoltesek/eSzemelyi_Kliens_x64_${_pkgver}.deb
        https://eszemelyi.hu/wp-content/uploads/2021/09/eSzemelyi_Kliens_vegfelhasznaloi_nyilatkozat_v13.pdf)
sha256sums=('50321a36afe81a0c14f0182eb79a925ef1c44af1ab7418312591aaa00d6f6949'
            '518d83d0702051bc7e82f29ccb29504aa14104a0f006a19c3c25b8c78313c5c5')

package() {
 ar x "${srcdir}/eSzemelyi_Kliens_x64_${_pkgver}.deb"
 tar -C "${pkgdir}" -xJf "${srcdir}/data.tar.xz"

 install -m644 -D "${srcdir}/eSzemelyi_Kliens_vegfelhasznaloi_nyilatkozat_v13.pdf" \
    "${pkgdir}/usr/share/licenses/eszig/eSzemelyi_Kliens_vegfelhasznaloi_nyilatkozat_v13.pdf"
}
