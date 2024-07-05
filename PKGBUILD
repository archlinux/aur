# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="s3-edit"
pkgname="${_pkgname}-bin"
pkgver=0.0.16
pkgrel=1
pkgdesc="Edit directly a file on Amazon S3 in CLI"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/tsub/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f4615101d8d0cc59bda70783b0b6548141e4982123bc31258054c7323e8af3b2')
sha256sums_i686=('0719448f4f309ec9e6525fc42c7bdf8669eb3e27b45c199689082991de708635')
sha256sums_aarch64=('2c5f122c32dc7277767da0869fbb8425179508228dfeeebd0b69037b0176be22')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
