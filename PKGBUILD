# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname="shuffledns-bin"
pkgver=1.0.8
pkgrel=1
pkgdesc='MassDNS wrapper to resolve and enumerate valid subdomains'
arch=('x86_64')
url="https://projectdiscovery.io/"
_githuburl='https://github.com/projectdiscovery/shuffledns'
license=('GPL3')
depends=('massdns')
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.zip")
sha256sums=('be9f2b12897ecba7c8612ad7052be0f4be8389c690a211c1478a684b7d03dc9c')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}