# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="bee"
pkgname="${_pkgname}-bin"
pkgver=1.10.0
pkgrel=1
pkgdesc="A tool for helping develop with beego app framework"
arch=('x86_64' 'i686' 'arm')
url="https://github.com/beego/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_arm=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.tar.gz")
sha256sums_x86_64=('3d46f5ea4657937a327141b6feadc61ce4a8dffc9f9cec8f0738299bfb15e29d')
sha256sums_i686=('dfd08fd911a848adad36630040f3609ee0c656d0abe05139584fc5fb6ac26cde')
sha256sums_arm=('78eeaca035949770dcaba4838bd0da0ac68346df71de4fe0f711f7cdd2c124e0')

case "${CARCH}" in
  x86_64)
    _arch="amd64"
    ;;
  i686)
    _arch="386"
    ;;
  arm)
    _arch="arm"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

package() {
  cd "${srcdir}/${_pkgname}_${pkgver}_linux_${_arch}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
