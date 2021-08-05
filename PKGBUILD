# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=('eszig')
pkgver=1.6.21
_pkgver=$(echo ${pkgver} | sed -r 's/\./_/g')
pkgrel=1
pkgdesc="eSzemelyi Kliens, Hungarian personal electronic ID card software client"
arch=('x86_64' 'i586')
license=('custom')
url="https://eszemelyi.hu/"
depends=('pcsclite' 'qt5-base')
source=(https://eszemelyi.hu/app/eSzemelyi_Kliens_x64_${_pkgver}.deb
        https://eszemelyi.hu/dok/eSzemelyi_Kliens_vegfelhasznaloi_nyilatkozat_v13.pdf)
sha256sums=('1c3b55c399e99c8f49bdd6190b7bea47a6fdf4b5f6b1ee412f3336ecaad417ab'
            'bbc98c70786cac81ccbde6d741db1c111dc65ee7197a44ca5b2cd78f179f3a89')

package() {
 ar x "${srcdir}/eSzemelyi_Kliens_x64_${_pkgver}.deb"
 tar -C "${pkgdir}" -xJf "${srcdir}/data.tar.xz"

 install -m644 -D "${srcdir}/eSzemelyi_Kliens_vegfelhasznaloi_nyilatkozat_v10.pdf" \
    "${pkgdir}/usr/share/licenses/eszig/eSzemelyi_Kliens_vegfelhasznaloi_nyilatkozat_v10.pdf"
}
