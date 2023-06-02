# Maintainer: chardon55 <charlesdong_2000@outlook.com>

pkgname=deno-init
pkgver=1.0+deno+1.x
pkgrel=1
pkgdesc="Initializer AUR providing the latest deno runtime, then you can upgrade deno by \`deno upgrade\`"
arch=('x86_64' 'aarch64')
url="https://deno.com/runtime"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git deno-bin)

_target_x86_64=deno-$CARCH-unknown-linux-gnu.zip
source_x86_64=(
    https://github.com/denoland/deno/releases/latest/download/$_target_x86_64
)
sha256sums_x86_64=(SKIP)

_target_aarch64=deno-linux-arm64.zip
source_aarch64=(
    https://github.com/LukeChannings/deno-arm64/releases/latest/download/$_target_aarch64
)
sha256sums_aarch64=(SKIP)

package() {
    install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
