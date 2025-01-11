# Maintainer: tarik02 <taras[dot]fomin[at]gmail[dot]com>

pkgname=ssh-ggh-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Recall your SSH sessions (also search your SSH config file)"
arch=('x86_64' 'aarch64')
url="https://github.com/byawitz/ggh"
license=('Apache-2.0')

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
depends=(openssh)

source_x86_64=("ggh-x86_64::https://github.com/byawitz/ggh/releases/download/v${pkgver}/ggh_linux_x86_64")
source_aarch64=("ggh-aarch64::https://github.com/byawitz/ggh/releases/download/v${pkgver}/ggh_linux_arm64")

sha256sums_x86_64=('ae5675d6833c4c6ff558413599f53a6e248935aa96725d18029ecf763ee01909')
sha256sums_aarch64=('ffba529da2bfe08f457f27feb12d5a720cb078de9b4badb55db74eaad866259a')

package() {
  # bin
  install -Dm755 "$srcdir/ggh-$CARCH" "${pkgdir}/usr/bin/ggh"
}
