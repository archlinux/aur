# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ptsh"
pkgname="${_pkgname}-bin"
_pkgName="ptSh"
pkgver=0.4
pkgrel=1
pkgdesc="Visually customizable shell utils"
arch=('x86_64' 'i686')
url="https://github.com/jszczerbinsky/${_pkgName}"
license=('MIT')
depends=('glibc' 'bash')
provides=("${_pkgname}" 'ptcp' 'ptls' 'ptpwd')
conflicts=("${_pkgname}" 'ptcp' 'ptls' 'ptpwd')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgName}_v${pkgver}-linux_x86_64.zip")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgName}_v${pkgver}-linux_i686.zip")
sha256sums_x86_64=('3e83cf8269ab5c58aedc5df1b7cb3dccf6255fb546afe6a430c1a68b3cbc2b33')
sha256sums_i686=('920b12bd5a080b19407f6fe859bab1412e2411e734d38807dff929a0ef24ec01')

package() {
  cd "${srcdir}"
  find "bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/{}" \;
}