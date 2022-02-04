# Maintainer: knochenhans
pkgname=ocelot
pkgver=3.0
pkgrel=1
pkgdesc='Open source workbench for working with XLIFF files in a post-editing and language review environment.'
arch=('any')
url='https://github.com/vistatec/ocelot/'
license=('LGPL3')
depends=('java-runtime')
source=("https://github.com/vistatec/ocelot/releases/download/v3.0/$pkgname-$pkgver.jar"
        "ocelot.sh"
        "$pkgname.desktop")
sha256sums=('e4a49ab42beb01b93563447d42eba10b4a7e1f0382cc15ccf3603df329433b24'
            '26d1a0c6da4fcf868e8858429850043969a88330079df6e1e98ee30a3bf7a731'
            'c4198e839a43531484e02055f4c2ea73e0c541f0832a498bcb480e3daf14401c')
package() {
	install -d ${pkgdir}/usr/{bin,share/java/${pkgname}}
	install -Dm 755 ${srcdir}/${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
	install -Dm 755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
	install -Dm 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
