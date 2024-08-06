# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.30.0
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://app-updates.agilebits.com/product_history/CLI2"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_amd64_v${pkgver}.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_386_v${pkgver}.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_arm_v${pkgver}.zip")
source_armv6h=("${source_arm}")
source_aarch64=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_arm64_v${pkgver}.zip")

sha256sums_x86_64=('cd5361b074cd40eb2b332885f35a4d61c74369919ced95190c885f4d4f739dc7')
sha256sums_i686=('8bcddcd505958cb654572cc5e50533a22b0637bcdd0f0b05e8e5ec5fe0ca75e9')
sha256sums_arm=('a611b45aa49f4e66ec57d3a5e4c0ce8c5392da72077e947c2532c9a53c152d8d')
sha256sums_armv6h=("${sha256sums_arm}")
sha256sums_aarch64=('c0618a4d4defa5d61606dfb4eaf7d5f39cf6361382c4943449df95fa1f7cc310')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "${pkgdir}"/usr/bin/op
}

# vim:set ts=2 sw=2 et:
