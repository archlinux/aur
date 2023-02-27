pkgname=ossutil-bin
_pkgname=ossutil
pkgver=1.7.15
pkgrel=1
pkgdesc="This tool aims to provide a convenient-to-use command line for users to manage data in OSS."
url="https://github.com/aliyun/ossutil"

conflicts=('ossutil')
depends=('glibc')
provides=('ossutil')
license=('MIT')
arch=('x86_64')

source=(
  "LICENSE::https://raw.githubusercontent.com/aliyun/${_pkgname}/master/LICENSE"
  "${_pkgname}::https://gosspublic.alicdn.com/${_pkgname}/${pkgver}/${_pkgname}64"
)

sha256sums=(
  '5dee8031676245920361e38dde7cc4d91f2b063f1c5a2b2a66cab1c008845b0b'
  '5554c38364281eaddee9af6f10c35f6ae3cebb323ab37272d9fc61f94f25d287'
)

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
