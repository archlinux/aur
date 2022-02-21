# Maintainer: inugroho <inugroho@gmail.com>
pkgname=jobson-bin
pkgver=1.0.12
pkgrel=1
pkgdesc="A web server that can turn command-line applications into a job system."
arch=('any')
url="https://github.com/adamkewley/jobson"
license=('Apache')
groups=('')
depends=('java-runtime')
options=('!strip' '!emptydirs')
source=(
		"jobson"
		"https://github.com/adamkewley/jobson/releases/download/${pkgver}/jobson-nix-${pkgver}.tar.gz"
	)
sha512sums=('fb35f8f5b47cf32f778d027da16fb2947ed478cec79d2d4408305bae402ea74872d14f8898705e6c2bfaedea0ffac912162e99f4aff3bc8436b791a51e073154'
            '52ef8002af96296ee751e1ee63a22fc8e200a2599eb59540e86b7d4540f49315585b5f7231f0d9829e1edd6e4f4b3233e948399c9550b070d3836d322ca4f6f6')
package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/jobson-nix-${pkgver}"/share/* "${pkgdir}/opt/${pkgname}"
  ln -sr "${pkgdir}/opt/${pkgname}/java/jobson-${pkgver}.jar" "${pkgdir}/opt/${pkgname}/java/jobson.jar"
  mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/jobson" "${pkgdir}/usr/bin"
}
