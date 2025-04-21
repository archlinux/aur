# Maintainer: Zhong Lufan <lufanzhong@gmail.com>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2164

pkgname=wsl2-ssh-agent-bin
pkgver=0.9.5
pkgrel=1
pkgdesc="A bridge from WSL2 ssh client to Windows ssh-agent.exe service (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/mame/wsl2-ssh-agent"
license=('MIT')
source_x86_64=("${pkgname}-${pkgver}_x86_64::https://github.com/mame/wsl2-ssh-agent/releases/download/v${pkgver}/wsl2-ssh-agent")
source_aarch64=("${pkgname}-${pkgver}_aarch64::https://github.com/mame/wsl2-ssh-agent/releases/download/v${pkgver}/wsl2-ssh-agent-arm64")
sha256sums_x86_64=('c5d25c5668c41099ef54a13ac19038e3b47dec8b95e9515c394c4b072c1e2aae')
sha256sums_aarch64=('4852bcfb84efccc5059b58828a27b46ae094f0025191b9c1ddee817917a8f3ed')

package() {
  install -Dm 755 ${pkgname}-${pkgver}_${CARCH} "$pkgdir"/usr/bin/wsl2-ssh-agent
}
