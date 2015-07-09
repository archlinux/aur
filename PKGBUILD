# Maintainer: oozyslug <oozyslug at gmail dot com>
# Contributor: oozyslug <oozyslug at gmail dot com>
# Submitter: oozyslug <oozyslug at gmail dot com>

pkgname=hugo
pkgver=0.14
pkgrel=1
pkgdesc="Fast and Flexible Static Site Generator in Go"
arch=('x86_64' 'i686' 'arm')
url="http://hugo.spf13.com/"
license=('custom:SimPL')
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
sha256sums_x86_64=('e5a455f019aa1811f76cfa3c899dc45b61e5c01dc3ad0cc98261836cbf637803')
sha256sums_i686=('8327776db22aa948d39c065e2460dadf009cbf5bdec87bcbe65b6ff2722882fb')
sha256sums_arm=('3ca7f98ab099614544e7d43068c8cf2a3c4b71b0166cd4127ce3a2d9be20c827')

package() {
  cd ${pkgname}_${pkgver}_linux_${_PKGARCH}

  install -Dm755 "${pkgname}_${pkgver}_linux_${_PKGARCH}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

