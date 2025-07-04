# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: anjvw <ber762631@gmail.com>

_pkgname="candy"
pkgname="${_pkgname}-bin"
pkgver=6.1.0
pkgrel=1
pkgdesc="A simple networking tool"
arch=('aarch64' 'armv7h' 'loong64' 'riscv64' 'x86_64')
url="https://github.com/lanthora/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}.cfg")
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
sha256sums_aarch64=('75e0d95d218015146c586571f719e9c3c1d42c2b4331daf002afea906e0ee98c')
sha256sums_armv7h=('c50abb4c2a5cfc4ecea9aaf8c90702b6f9b9aff4c5de82dc6179f0144e406a33')
sha256sums_loong64=('9eb1f7f6e8c94015e99a9804a56116d183f0c928269068d892865c99c84685ca')
sha256sums_riscv64=('f40075a7818c60a51f829766a26492c8b104b0a8405dc492ef41fa2dc7dd3f6d')
sha256sums_x86_64=('931dd83e243528fda7acd1a2870de4e30c87f0c8fcb8a648e7a6210759639bcc')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgname}.cfg" "${pkgdir}/etc/${_pkgname}.cfg"
  install -vDm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -vDm644 "${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
}
