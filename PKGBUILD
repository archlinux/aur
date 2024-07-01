# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Namalsk

_pkgname="unfurl"
pkgname="${_pkgname}-bin"
pkgver=0.4.3
pkgrel=2
pkgdesc="Pull out bits of URLs provided on stdin"
arch=('x86_64' 'i686')
url="https://github.com/tomnomnom/${_pkgname}"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(${url}/raw/v${pkgver}/{README.mkd,LICENSE})
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-${pkgver}.tgz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-386-${pkgver}.tgz")
sha256sums=('5ab51bb0a64e4fa357ca17e4d3e52103b4863abd29d2ed0db9394b1870d97dab'
            '2fb3b028c25279b9a6edb7f49d0203d991f51fdee868fec3fe93cd1a275ae748')
sha256sums_x86_64=('a5d0aed73af8fc0fcbd999422addd0f644e62457bad89d508e295cd2accd71d6')
sha256sums_i686=('e04f360ce6c35655c1dbf6de5106c137734ca49e4c5c760487d51261aad901b3')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.mkd" "${pkgdir}/usr/share/doc/${_pkgname}/README.mkd"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
