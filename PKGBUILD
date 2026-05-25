# Maintainer: BBJ <bbj@bbj.dev>
pkgname=kimi-cli-bin
pkgver=1.44.0
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
sha256sums_x86_64=('886407f2632434c91496a342ec6dc3a0f2c4b3fccdb2995505f75133ec21ad44')
sha256sums_aarch64=('4ff55fbdf1869ad2bc72b7c47cccc29d49bd0e5ebe97c29fce2c0a2c1c57a569')

package() {
  install -Dm755 kimi "${pkgdir}/usr/bin/kimi"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
