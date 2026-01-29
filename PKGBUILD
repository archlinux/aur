# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sachaos
_pkgname=todoist
pkgname=${_pkgname}-bin
pkgver=0.23.0
pkgrel=1
pkgdesc='Todoist CLI Client, written in Golang.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums=('d570f605a0fcedf7c47c390807dc37a0ffbbce5e291c8ce4c684044ede428c6f'
            '1511ff4a22b72ba6225bc9d0b13ec80fd69cf37f6b10bf5f4052eb6b7ba6291f')
sha256sums_x86_64=('5a7e316c4106ee25015db514fa6676307755fc7c6871d3d7725acba1130555c2')
sha256sums_i686=('15afc881ea229eb70cdb01d42cf9307440486aba2fb5e35689fcb1af38c73d21')
sha256sums_aarch64=('dd1c0dca792fb75a65e2f640c45e1ee305b249e9b9aeda997e83fdd5c5fa9995')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
