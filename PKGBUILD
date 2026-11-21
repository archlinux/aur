# Maintainer: Chapman <touch65536@gmail.com>
pkgname=pan-tools-bin
pkgver=5.0.1
pkgrel=1
pkgdesc="Modern Baidu Netdisk CLI & interactive TUI client (precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/qwerprog/pan-tools"
license=('Apache-2.0')
provides=('pan-tools')
conflicts=('pan-tools' 'pan-tools-git')
options=('!debug')
source_x86_64=("pant-v${pkgver}-linux-amd64.tar.gz::https://github.com/qwerprog/pan-tools/releases/download/v${pkgver}/pant-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("pant-v${pkgver}-linux-arm64.tar.gz::https://github.com/qwerprog/pan-tools/releases/download/v${pkgver}/pant-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('f530dd0f7982045538164a01d088cedef6bcfa13c45cfc16327f6bdf61919ce8')
sha256sums_aarch64=('4290396d939f0036fcc7a0a3fd69c3464102b6a079e9f2dedc6d02c172e39ee4')

package() {
  local _arch="amd64"
  if [[ "$CARCH" == "aarch64" ]]; then
    _arch="arm64"
  fi
  local _dir="${srcdir}/pant-v${pkgver}-linux-${_arch}"
  install -Dm755 "${_dir}/pant" "${pkgdir}/usr/bin/pant"
  install -Dm644 "${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_dir}/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  install -Dm644 "${_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
