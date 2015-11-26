# Maintainer: oozyslug <oozyslug at gmail dot com>
# Contributor: oozyslug <oozyslug at gmail dot com>
# Submitter: oozyslug <oozyslug at gmail dot com>

pkgname=hugo
pkgver=0.15
pkgrel=1
pkgdesc="Fast and Flexible Static Site Generator in Go"
arch=('x86_64' 'i686' 'arm')
url="http://hugo.spf13.com/"
license=('Apache')
if [ "$CARCH" = "i686" ]; then
  _PKGARCH=386
elif [ "$CARCH" = "arm" ]; then
  _PKGARCH=arm
else
  _PKGARCH=amd64
fi
source_x86_64=("https://github.com/spf13/hugo/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("https://github.com/spf13/hugo/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_386.tar.gz")
source_arm=("https://github.com/spf13/hugo/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_arm.tar.gz")
sha256sums_x86_64=('32a6335bd76f72867efdec9306a8a7eb7b9498a2e0478105efa96c1febadb09b')
sha256sums_i686=('af28c4cbb16db765535113f361a38b2249c634ce2d3798dcf5b795de6e4b7ecf')
sha256sums_arm=('886dd1a843c057a46c541011183dd558469250580e81450eedbd1a4d041e9234')

package() {
  cd ${pkgname}_${pkgver}_linux_${_PKGARCH}

  install -Dm755 "${pkgname}_${pkgver}_linux_${_PKGARCH}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

