# Maintainer: anon <anon@example.com>

pkgname=spotify-wayland
pkgver=0.1.0
pkgrel=1
pkgdesc="A proprietary music streaming service (no X11 dependencies)"
arch=('x86_64')
url="https://community.spotify.com/t5/Desktop-Linux/Wayland-support/m-p/5320462/highlight/true#M20892"
license=('custom')
depends=('spotify')
source=(
    "xstub.c"
    "spotify-wayland.desktop"
)
b2sums=(
    'ad7ad689d7651a742739eacc814a769a2479480cabe0d0e9349e9111e74dc72e150e2527784d930457ab5ca2c645da36e8f19f2487b999c830ad2f50cb166dc3'
    'f3269bff62fb69df4b6b762c86ba2b550f5bbeaabcadd0928e36acc3c852af291cf4c6c24dfd0871e4ab9d4565f81cff5ffa42fea81d8d0a29a7c0e8276e295e'
)

build() {
    cd "$srcdir"
    cc xstub.c -o xstub.so -shared -s
}

package() {
    cd "$srcdir"
    install -Dm644 xstub.so "$pkgdir/usr/lib/spotify-xstub.so"
    install -Dm644 spotify-wayland.desktop "$pkgdir/usr/share/applications/spotify-wayland.desktop"
}
