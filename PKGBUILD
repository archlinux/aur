# Contributor: pyjano <pyjano at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-ibm-plex
pkgver=1.2.1
pkgrel=1
url="https://github.com/IBM/type"
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces in truetype format"
arch=('any')
license=('custom')
source=("${pkgname#ttf-}-$pkgver-truetype.zip::https://github.com/IBM/plex/releases/download/v$pkgver/TrueType.zip")
sha256sums=('73f6afefcf3d56d5c7f45d788b7c65c6986183e2efff1576f731b2a5e99df6de')

package() {
  cd TrueType
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
  install -d "${pkgdir}"/usr/share/fonts/TTF
  find . -name "*.ttf" -exec install -Dm644 {} "${pkgdir}"/usr/share/fonts/TTF \;
}
