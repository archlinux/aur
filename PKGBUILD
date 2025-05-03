# Maintainer: Zhong Lufan <lufanzhong@gmail.com>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2164

pkgname=wsl2-ssh-agent-bin
pkgver=0.9.6
pkgrel=1
pkgdesc="A bridge from WSL2 ssh client to Windows ssh-agent.exe service (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/mame/wsl2-ssh-agent"
license=('MIT')
source_x86_64=("${pkgname}-${pkgver}_x86_64::https://github.com/mame/wsl2-ssh-agent/releases/download/v${pkgver}/wsl2-ssh-agent")
source_aarch64=("${pkgname}-${pkgver}_aarch64::https://github.com/mame/wsl2-ssh-agent/releases/download/v${pkgver}/wsl2-ssh-agent-arm64")
sha256sums_x86_64=('0d080edabe300ef94f858f1a937188eccd96115e875fb22da3c54479cbd57207')
sha256sums_aarch64=('1e054c288464fed58a4a2dd22ebcae2993776e17ef13a6d254d4c70201d4cfc6')

package() {
  install -Dm 755 ${pkgname}-${pkgver}_${CARCH} "$pkgdir"/usr/bin/wsl2-ssh-agent
}
