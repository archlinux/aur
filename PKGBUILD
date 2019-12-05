# Maintainer: Augusto Modanese <augusto DOT modanese AT student DOT kit DOT edu>
# Contributor: Max Zhao <alcasa.mz@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Kevin Peters <65bones AT gmail DOT com>
# Contributor: Ali H. Caliskan <ali.h.caliskan AT gmail DOT com>

pkgname=jstock
pkgver=1.0.7.42
pkgrel=1
pkgdesc="A stock market software that helps you make smart investment decision"
arch=('any')
url="http://jstock.sourceforge.net/"
license=('GPL')
depends=('java-runtime' 'java-openjfx')
source=("https://github.com/yccheok/${pkgname}/releases/download/release_${pkgver//./-}/${pkgname}-${pkgver}-bin.zip"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
sha512sums=('4a993ef3065209e7562da78729398673657888949e99892f38fb3e9cd497b4fa37b2afbca2e031c11aaa8cfcb539e55f1bcdf2f521ac27d4111f9170672f73d0'
            'f9072e95a164ae8929cab855104da4e2474e47d83fa4a854037452950b541462ac55f04c60c6adbd7274c4bb286e497889ffa38eaafae6d86b76e75bc0665c6e'
            '87cb6730b3d707906eca4f705cd12094302b9dfed174eb55c5f010d896237bc200dfb042b9080baed99e112e03427b0ff13085e485b26ba3f6b10ee96dd5fce7'
            '79e2d8b1ec1fa1b4697b6335870d7c8f0c71a8587c6544e3abd09220476876855e9dcc6b1cad2519b9ee34f2f301590801adec23ee2ae65c4c6cddda83c48888')

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
