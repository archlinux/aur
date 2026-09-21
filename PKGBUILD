# Maintainer: BBJ <bbj@bbj.dev>
pkgname=kimi-cli-bin
pkgver=1.51.0
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
sha256sums_x86_64=('538f81a212fcfdbd0a7f73e06973d925b8ecdeb842a0b914857691d77abf2afb')
sha256sums_aarch64=('329edc376ebd4dba9e359b49c27ce6c0ae23c43e7488349c2f1ae29a6d76273e')

package() {
  install -Dm755 kimi "${pkgdir}/usr/bin/kimi"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
