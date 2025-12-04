# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: anjvw <ber762631@gmail.com>

_pkgname="candy"
pkgname="${_pkgname}-bin"
pkgver=6.1.4
pkgrel=1
pkgdesc="A tool for creating and managing a virtual network implemented in C++"
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
sha256sums_aarch64=('4f8add46be1318a7fd90e6e0bbd7cee5c0e935821cb1c3df826a58db2af3df53')
sha256sums_armv7h=('8f19c2eeb5daa497dd1329ee6e888ba234db0473543ef40b506c0237a2c915be')
sha256sums_loong64=('448f7213edea4dfb2412edd669648ee8e9cd97a22f56f973fbc519bbe9490afb')
sha256sums_riscv64=('b0a54230b3a1eff959ed3349e35e1196af49496801df35f984f182cf809f9fef')
sha256sums_x86_64=('2c56d7de9c3c14202ac2de567dcf4e6b94292c1f1caf3447b11a93865b258eb4')

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
