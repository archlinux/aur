# Maintainer: BBJ <bbj@bbj.dev>
pkgname=kimi-cli-bin
pkgver=1.45.0
pkgrel=1
pkgdesc="Kimi Code CLI - AI coding agent (precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/MoonshotAI/kimi-cli"
license=('Apache-2.0')
provides=('kimi-cli')
conflicts=('kimi-cli')
depends=('glibc' 'zlib')
options=('!strip')

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/MoonshotAI/kimi-cli/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/MoonshotAI/kimi-cli/releases/download/${pkgver}/kimi-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/MoonshotAI/kimi-cli/releases/download/${pkgver}/kimi-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums=('58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')
sha256sums_x86_64=('2a4cacd207a2ac9bbbd52d2f57d16aa0cc6bafb1fa7408ec5615a44721344d4b')
sha256sums_aarch64=('93b454e23394b09b9d8b1ce6ad1fc47d1f5b4723393a16e0a11cd35e7a3f5d55')

package() {
  install -Dm755 kimi "${pkgdir}/usr/bin/kimi"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
