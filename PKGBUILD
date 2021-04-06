# Maintainer: Yohann D'Anello <ynerant [at] crans [dot] org>

pkgname=bootstrap5
pkgver=5.0.0b3
# During beta, store full version number with the dash
pkgfullver=5.0.0-beta3
pkgrel=1
pkgdesc="Front-end framework for web development"
arch=('any')
url="https://getbootstrap.com/"
license=('MIT')
optdepends=()
install=bootstrap.install
source=("https://github.com/twbs/bootstrap/releases/download/v${pkgfullver}/bootstrap-${pkgfullver}-dist.zip"
	"LICENSE")
sha256sums=('1c1d512fb0d59997a7fb12a340f1bb63f2827dd490e742aeea138b4fcf16bb2b'
            '5b30317c9c35bb6f05101c501de866cc6852ab9b655dcf5941733f6644c3ebd0')

package() {
  cd bootstrap-${pkgfullver}-dist
  install -d ${pkgdir}/usr/share/javascript/${pkgname}/{css,js}
  for _jsfile in ./js/*; do
	install -m0644 "${_jsfile}" "${pkgdir}/usr/share/javascript/${pkgname}/js/"
  done
  for _cssfile in ./css/*; do
	install -m0644 "${_cssfile}" "${pkgdir}/usr/share/javascript/${pkgname}/css/"
  done
  install -Dm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
