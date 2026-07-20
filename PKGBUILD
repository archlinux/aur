# Maintainer: copypasteonly <denzeldadang@protonmail.com>
# Contributors: slurpee, Ben Woodward, Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli-beta
pkgver=2.38.0_beta.01
pkgrel=1
pkgdesc="1Password command line tool (beta)"
arch=('x86_64')
url="https://app-updates.agilebits.com/product_history/CLI2"
license=('LicenseRef-1Password')
provides=('1password-cli')
conflicts=('1password-cli')
options=('!strip' '!emptydirs')
install=1password-cli-beta.install
validpgpkeys=('3FEF9748469ADBE15DA7CA80AC2D62742012EA22')

_upstream_ver="${pkgver//_/-}"

source_x86_64=(
  "https://cache.agilebits.com/dist/1P/op2/pkg/v${_upstream_ver}/op_linux_amd64_v${_upstream_ver}.zip"
)

sha256sums_x86_64=(
  'ab5617d23cf99f5df5fef983c0d1c1f9b3421c28d0c5764863350365d4315857'
)

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify "${srcdir}/op.sig" "${srcdir}/op"
  fi
}

package() {
  install -Dm755 "${srcdir}/op" "${pkgdir}/usr/bin/op"
}
