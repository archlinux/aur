# Maintainer: Max Zhao <alcasa.mz@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Kevin Peters <65bones AT gmail DOT com>
# Contributor: Ali H. Caliskan <ali.h.caliskan AT gmail DOT com>

pkgname=jstock
pkgver=1.0.7.14
pkgrel=1
pkgdesc="A stock market software that helps you make smart investment decision"
arch=('any')
url="http://jstock.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=("https://github.com/yccheok/${pkgname}/releases/download/release_${pkgver//./-}/${pkgname}-${pkgver}-bin.zip"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('c44139c837bcea7c51acb99921511043'
         '7a68e77a1dccdd89db242d799c9f2d8e'
         'c2483790417a4ca80b7a65006f696679'
         'c025a2cf0c187bb4b5fbb5114f15ac4a')

package() {
  cd "${srcdir}/${pkgname}"

  # Install program files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r * "${pkgdir}/usr/share/${pkgname}"

  # Install a launcher
  install -Dm755 ../${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
