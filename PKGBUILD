# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: anjvw <ber762631@gmail.com>

_pkgname="candy"
pkgname="${_pkgname}-bin"
pkgver=6.1.2
pkgrel=1
pkgdesc="A simple networking tool"
arch=('aarch64' 'armv7h' 'loong64' 'riscv64' 'x86_64')
url="https://github.com/lanthora/candy"
license=('MIT')
provides=("candy")
conflicts=("candy")
backup=("etc/candy.cfg")
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}+linux_aarch64.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}+linux_armhf.tar.gz")
source_loong64=("${_pkgsrc}-loong64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}+linux_loongarch64.tar.gz")
source_riscv64=("${_pkgsrc}-riscv64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}+linux_riscv64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}+linux_x86_64.tar.gz")
sha256sums=('80e9eace4c80dc740e9d17d64ce2cc5f9b8ca41b057bfe8c2c31e849f8f7aeb5'
            '7abc3e1f887be8cf25e77d95486a22a7b6d62f368e864785d995138db7220dcf')
sha256sums_aarch64=('184ea32d44adc93869de3e0d9812180485ec3d3b9589613afe7e83ffd49fc9b5')
sha256sums_armv7h=('0281d5f7d1eb32d0770db63fca2a0f5e4d8822542a4afaaa0a1409d5e566bd5b')
sha256sums_loong64=('3b0caeb6430776c0cbca6ced950891300ce26290bc26dfa627b138074639ae77')
sha256sums_riscv64=('e8f00fe74e7f2ca41f1a53c8e603d840637d215caf8045d083688a542b175d83')
sha256sums_x86_64=('c2d3d26ee475799085f336c2588c64018588d6a238cc5077903d9cba062f1a75')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/candy/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/candy/LICENSE"

  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/candy"
  install -vDm755 "${_pkgname}-service" "${pkgdir}/usr/bin/candy-service"
  install -vDm644 "${_pkgname}.cfg" "${pkgdir}/etc/candy.cfg"
  install -vDm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/candy.service"
  install -vDm644 "${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/candy@.service"
}
