# Maintainer: Joel Tony <github@jaytau.com>
pkgname=px0-bin
pkgver=0.1.16
pkgrel=1
pkgdesc='Speed-first browser-based IDE for reviewing AI-generated code'
arch=('x86_64' 'aarch64' 'armv7h' 'i686' 'riscv64')
url='https://px0.ai'
license=('MIT')
provides=('px0')
conflicts=('px0')
options=('!strip' '!debug')
_src="https://github.com/px0-ai/px0/releases/download/v${pkgver}/px0-${pkgver}-linux"
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/px0-ai/px0/v${pkgver}/LICENSE")
source_x86_64=("px0-${pkgver}-amd64::${_src}-amd64")
source_aarch64=("px0-${pkgver}-arm64::${_src}-arm64")
source_armv7h=("px0-${pkgver}-arm::${_src}-arm")
source_i686=("px0-${pkgver}-386::${_src}-386")
source_riscv64=("px0-${pkgver}-riscv64::${_src}-riscv64")
sha256sums=('d15850ed7f28b9db8e43f69ba13f8856c2173652e0aee942c0a2d05be514fb0f')
sha256sums_x86_64=('7d9051f6358a820ea165b9459ff84c1fdca0a62d5394077827d082724e48b015')
sha256sums_aarch64=('c62c9c2a7abf21f2ace2731c091a5f51b6d416c333116cde3e7d3888bbf78f09')
sha256sums_armv7h=('04d270d8cedb2ed5864b93bc39aaabe0502b7625910a412103934fd3eacb5007')
sha256sums_i686=('50ea9dfa1457e08177b15fbd2a6f5133aa6c836700a8145e17d47da0eb7b775c')
sha256sums_riscv64=('bad708632843855324a49c38dbdadb2e33b2b7bcc35fbefb10936ce1c2bdf712')

package() {
  local _arch
  case "$CARCH" in
    x86_64) _arch=amd64 ;;
    aarch64) _arch=arm64 ;;
    armv7h) _arch=arm ;;
    i686) _arch=386 ;;
    riscv64) _arch=riscv64 ;;
  esac
  install -Dm755 "px0-${pkgver}-${_arch}" "$pkgdir/usr/bin/px0"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
