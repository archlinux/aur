# Maintainer: VincentZyu <vincentzyu233@gmail.com>
pkgname=winload-rust-bin
pkgver=0.1.6-beta.2
pkgrel=1
pkgdesc="A lightweight, real-time CLI tool for monitoring network bandwidth and traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/VincentZyuApps/winload"
license=('MIT')
provides=('winload')
conflicts=('winload' 'winload-rust')

source_x86_64=("winload-linux-x86_64-v${pkgver}::https://github.com/VincentZyuApps/winload/releases/download/v${pkgver}/winload-linux-x86_64-v${pkgver}")
source_aarch64=("winload-linux-aarch64-v${pkgver}::https://github.com/VincentZyuApps/winload/releases/download/v${pkgver}/winload-linux-aarch64-v${pkgver}")

noextract=()

sha256sums_x86_64=('aa22a37fc278d607665e7a1f45e52bc8d9c205a5c9634f06c0821cd1ccd92d47')
sha256sums_aarch64=('5cefdc8ecad584c1d2f6198de2f424dc1d03f32266d91f6627bbb8c1f0c207e4')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "$srcdir/winload-linux-x86_64-v${pkgver}" "$pkgdir/usr/bin/winload"
    elif [ "$CARCH" = "aarch64" ]; then
        install -Dm755 "$srcdir/winload-linux-aarch64-v${pkgver}" "$pkgdir/usr/bin/winload"
    fi
}
