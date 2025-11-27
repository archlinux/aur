# Maintainer: Zhong Lufan <lufanzhong@gmail.com>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2164

pkgname=wsl2-ssh-agent-bin
pkgver=0.9.7
pkgrel=1
pkgdesc="A bridge from WSL2 ssh client to Windows ssh-agent.exe service (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/mame/wsl2-ssh-agent"
license=('MIT')
source_x86_64=("${pkgname}-${pkgver}_x86_64::https://github.com/mame/wsl2-ssh-agent/releases/download/v${pkgver}/wsl2-ssh-agent")
source_aarch64=("${pkgname}-${pkgver}_aarch64::https://github.com/mame/wsl2-ssh-agent/releases/download/v${pkgver}/wsl2-ssh-agent-arm64")
sha256sums_x86_64=('281c64f6079598de1a455292d533f3ae21837980a3d3012074bc14ad695325d8')
sha256sums_aarch64=('e9cb0347a72ca68a511e48779080b80a22af1bf670e5a52c9f35f95951ce5221')

package() {
  install -Dm 755 ${pkgname}-${pkgver}_${CARCH} "$pkgdir"/usr/bin/wsl2-ssh-agent
}
