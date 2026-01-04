# Maintainer: ZephyrDRH <zephyrdrh at gmx dot de>
# Contributor: Alireza Ayinmehr <alireza.darksun@gmail.com>

pkgname='behdad-fonts'
pkgver=1.0.0
pkgrel=1
pkgdesc='Behdad is a Persian/Arabic font. This font is a gift to Behdad Esfahbod'
url='https://github.com/font-store/BehdadFont'
arch=(any)
license=('OFL-1.1')
provides=('ttf-behdad')
conflicts=('ttf-behdad')
makedepends=(unzip)
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Behdad-${pkgver}.zip"
        "${pkgname}-${pkgver}.LICENSE::https://raw.githubusercontent.com/font-store/BehdadFont/7c302bb454eef288edbaf67792d3f4e5abb91f24/OFL.txt")
sha512sums=('851d9e2ecc7d7b18d43ccfdfa7efefe3ca487825725fbcb49195fc693c48e2f7d15aef7c50e0d5a16bcbdf55d9794c91861c00f077bed2fc72255b59c8758f67'
            '9c12748b0aefe6689aa3b191cc82bda1b97742afd1d54c4572db64e4a22fa0213db25171a6c18df5644151f475372a725e4e1b946156d1cacd5d2bd04700a5c3')
noextract=("${pkgname}-${pkgver}")

prepare() {
    unzip ${pkgname}-${pkgver}
}

package() {
    install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./Behdad-${pkgver}/*.ttf
    install -Dm644 "${pkgname}-${pkgver}.LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
