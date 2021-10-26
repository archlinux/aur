# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=android-material-icons
pkgver=4.0.0
pkgrel=1
pkgdesc="Material Design icons by Google for Android Studio"
arch=('any')
url="https://google.github.io/material-design-icons/"
license=('Apache')
optdepends=('android-studio: the official Android IDE')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/material-design-icons/archive/${pkgver}.tar.gz")
sha512sums=('b55dfa39d050346d080ab6213836955d6e1799b8acd2cad96d9d04fa0ffab2477f9ea6b47b44af1542c99c5e69498196c81510b5dc632a6c9582487d3a79d85e')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
  install -d "${pkgdir}/opt/android-sdk/icons/material"
  bsdtar \
	-xf "${pkgname}-${pkgver}.tar.gz" \
	-C "${pkgdir}/opt/android-sdk/icons/material" \
	--strip-components 2 \
	"material-design-icons-${pkgver}/android/"
}
