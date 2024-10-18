# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=deno-init
pkgver=2.x.x
pkgrel=2
pkgdesc="Startup AUR providing the latest deno runtime, then you can upgrade deno using \`deno upgrade\`"
arch=('x86_64' 'aarch64')
url="https://deno.com"
license=(MIT)
provides=(deno)
conflicts=(deno)

_target=deno-$CARCH-unknown-linux-gnu.zip
_baseurl=https://github.com/denoland/deno/releases/latest/download
source=(
    $_baseurl/${_target}
    $_baseurl/${_target}.sha256sum
)
sha256sums=(
    SKIP
    SKIP
)

check() {
    cd $srcdir

    echo "Checksums: "
    sha256sum -c $_target.sha256sum
}

package() {
    install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
