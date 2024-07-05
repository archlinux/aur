# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="fac"
pkgname="${_pkgname}-bin"
pkgver=2.0.0
pkgrel=2
pkgdesc="Easy-to-use command line tool for fixing git conflicts"
arch=('x86_64')
url="https://github.com/mkchoi212/${_pkgname}"
license=('MIT')
depends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/raw/v${pkgver}/assets/doc/${_pkgname}.1")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('9465f6d5f7c83379972bcd816b89914d9dbc661fed87d841e5a377d89e7f29d6')
sha256sums_x86_64=('91a58e84e0098a1eee45af950ee5cc80d30c083e2ab24cdbe79dd6be514775d9')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
