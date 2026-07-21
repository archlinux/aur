# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Maintainer: olivierlm <mail nospamat olivierlemoal nospamdot fr>
# Contributor redtide <redtid3 nospamat gmail nospamdot com>
# Contributor Anders Thomsen <mail nospamat andersthomsen nospamdot dk>

pkgname=xairedit-bin
_pkgname="${pkgname%-bin}" # Removes trailing "-bin"
pkgver=1.8.1
pkgrel=2
pkgdesc="Remote control program for Behringer X-AIR mixers"
arch=("x86_64" "armv7h")
url="https://www.behringer.com/series.html?category=R-BEHRINGER-XAIRSERIES"
license=('custom')
makedepends=("gendesk")
depends=("alsa-lib" "freetype2" "curl" "libglvnd" "gcc-libs" "glibc")

source=('EULA_2012-09-12.pdf'
        "${_pkgname}.png::https://raw.githubusercontent.com/flathub/com.behringer.XAirEdit/refs/heads/master/com.behringer.XAirEdit.png")
source_x86_64=("X-AIR-Edit_LINUX_${pkgver}.tar.gz::https://cdn-media.empowertribe.com/4240ddc8835149e486922840e9379af0/X-AIR-Edit_LINUX_${pkgver}.tar.gz")
source_armv7h=("X-AIR-Edit_RASPI_${pkgver}.tar.gz::https://cdn-media.empowertribe.com/a354c773fc524f449572031c75f245fe/X-AIR-Edit_RASPI_${pkgver}.tar.gz")
sha512sums=('fe39285768937d82f31844b789d1075de8196495727653595e59f4f1b282f6dbe18a8a8bc51b837f284601dc37c52211d3d494a8636512f5398da31ff3d30284'
            '6b4f55ec1867bc16280483e3672ce15c2bcc3a27bfb79d346945618ecbf9e6d757a3fc2dd6752e7f37a6c5cf6d039cd81d63c178ba077575c1850d92e8039438')
sha512sums_x86_64=('cd5f2b3a6bb25416724a4a2418d0407ce7914115ebcf10c218e66bc7560f584d3e467d1bf1214a4fb5ac2fb301f8cf3ce7db638fde4a675255266d73798f508e')
sha512sums_armv7h=('6a22527cc34a87960f2f54623322bd0d1178509edcd7310c8ddd53cbbb6983ec9e1217ac49cbe3a660e700b1ebeb3b567ca8f324c82083318e357ea0d51915af')
b2sums=('f3af5fcb0044782d51ef976375b6184d781bab5110fb2184ac40443df7b21fdfc12ffa534448bb0aa41df8210c5e63a7d2995ee54279c2ec0824de5eb83aae64'
        'e5dd2bfcb89b2236b36a38d4c3be30b04e5ba43410923aeee28aca53876ab2d3d81893f0ce6abf66783aaabbdab99f2928bd521d6653016ac9fd14af9c9c8305')
b2sums_x86_64=('0065d4a6306fde3a854bb213ce427eae035dd89b23cb065ba0e1f801feaf8fc952c048cc0b4823e4604787a59381fe9d5d4b7f89404f7bd2599e92975fd9a138')
b2sums_armv7h=('9517ed8552680fd11f19da6da840d55d50aa3378377a3cec63ff245e1a809e17a4d819525a52265a4004609b7c05b92462e53ac1830547294881ccbf9ded6bb5')


prepare() {
	gendesk -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec="${_pkgname}" --name "X-AIR Edit" --icon "${_pkgname}.png" --categories "AudioVideo;Audio" --terminal=false --custom="Keywords=Mixer;Behringer;"
}

package() {
    install -Dm755 "X-AIR-Edit" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "EULA_2012-09-12.pdf" "${pkgdir}/usr/share/licenses/${_pkgname}/license.pdf"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
