# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Namalsk

_pkgname="unfurl"
pkgname="${_pkgname}-bin"
pkgver=0.4.3
pkgrel=2
pkgdesc="Pull out bits of URLs provided on stdin"
arch=('i686' 'x86_64')
url="https://github.com/tomnomnom/${_pkgname}"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.mkd::${url}/raw/refs/tags/v${pkgver}/README.mkd"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_i686=("${_pkgsrc}-i686.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-386-${pkgver}.tgz")
source_x86_64=("${_pkgsrc}-x86_64.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-${pkgver}.tgz")
sha256sums=('5ab51bb0a64e4fa357ca17e4d3e52103b4863abd29d2ed0db9394b1870d97dab'
            '2fb3b028c25279b9a6edb7f49d0203d991f51fdee868fec3fe93cd1a275ae748')
sha256sums_i686=('e04f360ce6c35655c1dbf6de5106c137734ca49e4c5c760487d51261aad901b3')
sha256sums_x86_64=('a5d0aed73af8fc0fcbd999422addd0f644e62457bad89d508e295cd2accd71d6')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.mkd" "${pkgdir}/usr/share/doc/${_pkgname}/README.mkd"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
