#
# Thank you Anders Thomsen for initial submission!
#
# Maintainer: redtide <redtid3@gmail.com>
# Maintainer: Sokoloft <sokoloft@protonmail.com>
#

pkgname=xairedit
pkgver=1.8.1
pkgrel=3
pkgdesc="Remote control program for Behringer X-AIR mixers"
arch=("x86_64" "armv7h")
url="https://www.behringer.com/series.html?category=R-BEHRINGER-XAIRSERIES"
license=('custom')
makedepends=("gendesk")
depends=("alsa-lib" "freetype2" "curl" "libglvnd" "gcc-libs" "glibc")

source=('EULA_2012-09-12.pdf'
        'xairedit.png::https://raw.githubusercontent.com/flathub/com.behringer.XAirEdit/refs/heads/master/com.behringer.XAirEdit.png')
source_x86_64=("X-AIR-Edit_LINUX_$pkgver.tar.gz::https://cdn.mediavalet.com/aunsw/musictribe/VX4UkGFjQ0a1DH2Q8zg3sg/_KJ6tGIG7kGVqPxP-OsnLQ/Original/X-AIR-Edit_LINUX_$pkgver.tar.gz")
source_armv7h=("X-AIR-Edit_RASPI_$pkgver.tar.gz::https://cdn.mediavalet.com/aunsw/musictribe/VX4UkGFjQ0a1DH2Q8zg3sg/_KJ6tGIG7kGVqPxP-OsnLQ/Original/X-AIR-Edit_RASPI_$pkgver.tar.gz")

sha512sums=('fe39285768937d82f31844b789d1075de8196495727653595e59f4f1b282f6dbe18a8a8bc51b837f284601dc37c52211d3d494a8636512f5398da31ff3d30284'
            '6b4f55ec1867bc16280483e3672ce15c2bcc3a27bfb79d346945618ecbf9e6d757a3fc2dd6752e7f37a6c5cf6d039cd81d63c178ba077575c1850d92e8039438')
sha512sums_x86_64=('cd5f2b3a6bb25416724a4a2418d0407ce7914115ebcf10c218e66bc7560f584d3e467d1bf1214a4fb5ac2fb301f8cf3ce7db638fde4a675255266d73798f508e')
sha512sums_armv7h=('cd5f2b3a6bb25416724a4a2418d0407ce7914115ebcf10c218e66bc7560f584d3e467d1bf1214a4fb5ac2fb301f8cf3ce7db638fde4a675255266d73798f508e')
b2sums=('f3af5fcb0044782d51ef976375b6184d781bab5110fb2184ac40443df7b21fdfc12ffa534448bb0aa41df8210c5e63a7d2995ee54279c2ec0824de5eb83aae64'
        'e5dd2bfcb89b2236b36a38d4c3be30b04e5ba43410923aeee28aca53876ab2d3d81893f0ce6abf66783aaabbdab99f2928bd521d6653016ac9fd14af9c9c8305')
b2sums_x86_64=('0065d4a6306fde3a854bb213ce427eae035dd89b23cb065ba0e1f801feaf8fc952c048cc0b4823e4604787a59381fe9d5d4b7f89404f7bd2599e92975fd9a138')
b2sums_armv7h=('0065d4a6306fde3a854bb213ce427eae035dd89b23cb065ba0e1f801feaf8fc952c048cc0b4823e4604787a59381fe9d5d4b7f89404f7bd2599e92975fd9a138')


prepare() {
	gendesk -n --pkgname "xairedit" --pkgdesc "${pkgdesc}" --exec="xairedit" --name "X-AIR Edit" --icon "${pkgname}.png" --categories "Audio;Mixer;AudioVideo;" --terminal=false --custom="Keywords=Mixer;"
}

package() {
    install -Dm755 "X-AIR-Edit" "$pkgdir/usr/bin/xairedit"
    install -Dm644 "EULA_2012-09-12.pdf" "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
    install -Dm644 "xairedit.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "xairedit.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
