# Maintainer: William Varmus <0@willvar.tw>
# Contributor: Pavlo <pavlofreemen@gmail.com>

pkgname=ossutil-bin
_pkgname=ossutil
pkgver=1.7.19
pkgrel=1
pkgdesc='A user-friendly command-line tool to access AliCloud OSS.'
arch=('x86_64')
url="https://github.com/aliyun/ossutil"
license=('MIT')
makedepends=('unzip')
conflicts=('ossutil')
provides=('ossutil')
source=(
  "${pkgname}-LICENSE::https://raw.githubusercontent.com/aliyun/${_pkgname}/master/LICENSE"
  "${pkgname}-${pkgver}.zip::https://gosspublic.alicdn.com/${_pkgname}/${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.zip"
  )
sha256sums=(
  '5dee8031676245920361e38dde7cc4d91f2b063f1c5a2b2a66cab1c008845b0b'
  'dcc512e4a893e16bbee63bc769339d8e56b21744fd83c8212a9d8baf28767343'
  )

package() {
  install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-amd64/ossutil64" "${pkgdir}/usr/bin/ossutil" \
  && install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
