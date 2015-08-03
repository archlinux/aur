# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=plotdigitizer
pkgver=2.6.6
pkgrel=2
pkgdesc="A program used to digitize scanned plots of functional data"
arch=('any')
url="http://plotdigitizer.sourceforge.net/"
license=('LGPL')
makedepends=('apache-ant')
depends=('java-runtime')
optdepends=('autotrace: enable the automatic tracing function')
source=('plotdigitizer.sh'
        'plotdigitizer.png'
        'plotdigitizer.desktop'
        "http://sourceforge.net/projects/plotdigitizer/files/plotdigitizer/${pkgver}/PlotDigitizer_${pkgver}_Source.zip")
md5sums=('d36f483582befb9cb67037da6b7d6945'
         '06c7419f4f5c9d07fea0b8044e8a2ff4'
         'a89612e09f10210013d9a4fb34c740b7'
         'ad2bcd25f0a5209a41e3b14254f2a27c')
sha512sums=('a87428458d6f116ac1cb3a8bf8b6327cecbea806b321e1ee9c9e4c67d15043e1c17e023445941e3e60be685b72a5b2c18b67b6ab7ddf9b1d83ed746d6b38e38a'
            '18f8e20236ea0929fcab67dcb58e7306fabad800296f8693423457c8ebdcdeeddacb69fd049c1473e74a263a3b924fa7a124780d751bafc3d05504f22622a384'
            'b60e18915504ea58a36de680dec2937843cb74a54a7d249bc22747b692238a7ca2f35b72c6b87c6ea0e2730de6e8d309bfa4ec30db8afef45090e73773402abe'
            'eeafa18019c2a3890a49e845f081ecb36a4987e3276bb1bb66cd1850cbf27b633d8b380d2481c1fa7aa3be8ea4e267f3900557926a41af9569609095963ba777')

build() {
  cd "${srcdir}/PlotDigitizer_Source"
  ant jar
}

package() {
  install -m644 -D "${srcdir}/PlotDigitizer_Source/jars/PlotDigitizer.jar" "${pkgdir}/usr/share/java/${pkgname}/PlotDigitizer.jar"
  install -m755 -D "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}.sh"
  install -m644 -D "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m644 -D "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
