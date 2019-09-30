# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

_pkgname='mtail'
pkgname="${_pkgname}-bin"
_pkgver=v3.0.0-rc33
pkgver="${_pkgver//-/_}"
pkgrel=2
pkgdesc='extract whitebox monitoring data from application logs for collection in a timeseries database'
arch=('x86_64')
url='https://github.com/google/mtail'
license=('Apache')
conflicts=("${_pkgname}")
source=("https://github.com/google/mtail/releases/download/${_pkgver}/${_pkgname}_${_pkgver}_linux_amd64"
	"https://raw.githubusercontent.com/google/mtail/master/LICENSE")
sha256sums=('5119d74d6d5519fcd4c32c25bcc144e32ff42dfc6fde32bc3af752423459fa9b'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package() {
  cd "${srcdir}"

  install -Dm755 "mtail_${_pkgver}_linux_amd64" "${pkgdir}/usr/bin/mtail"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
