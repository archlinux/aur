# Maintainer: inugroho <inugroho@gmail.com>
pkgname=jobson-bin
pkgver=1.0.11
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
            '15970ba6088eaeb13d41afae69740ccf0b76f8d64600201f5cbf1a71c4f3d9180bcc629e032f9719b21b82a97a1928cf9e49ccd4f41d07cd0124b9c2e97e3ab3')
package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/jobson-nix-${pkgver}"/share/* "${pkgdir}/opt/${pkgname}"
  ln -sr "${pkgdir}/opt/${pkgname}/java/jobson-${pkgver}.jar" "${pkgdir}/opt/${pkgname}/java/jobson.jar"
  mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/jobson" "${pkgdir}/usr/bin"
}
