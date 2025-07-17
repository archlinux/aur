# Maintainer: NelloKudo <marshnelloosu@gmail.com>

pkgname=cosu-trainer-bin
_pkgname=${pkgname%-bin}
pkgver=0.15
pkgrel=2
pkgdesc="Change various parameters of an osu! map easily"
arch=(x86_64)
url="https://github.com/hwsmm/cosutrainer"
license=(GPL-3.0-only)
depends=(fuse2)
options=(!strip)
install="$_pkgname.install"
source=("$pkgname-$pkgver.tar.zst::https://github.com/hwsmm/cosutrainer/releases/download/$pkgver/cosu-trainer-bin.tar.zst"
        "$_pkgname.desktop::https://raw.githubusercontent.com/hwsmm/cosutrainer/700306f4f97cbfe895b23f1955409f9c4be8f5b7/docs/cosu-trainer.desktop"
        "$_pkgname.png::https://raw.githubusercontent.com/hwsmm/cosutrainer/700306f4f97cbfe895b23f1955409f9c4be8f5b7/docs/cosutrainer.png")
sha256sums=("db1c149d4c302d3a0a84f3cb6e207c76f69caef9fc6e463478d3bb82855172d5"
            "8cded7c0156155f0afe57062f7d7c522cb1a13f4829c4b0680e3f02deaf10c3a"
            "e0c20261b51c196c8eeab2a9622650a803e71144b91395f9a239521bd44acdba")

package() {
    cd "$srcdir"

    # Installing binaries...
    install -Dm755 "$srcdir/osumem" "$pkgdir/usr/bin/osumem"
    install -Dm755 "$srcdir/cosu-cleanup" "$pkgdir/usr/bin/cosu-cleanup"
    install -Dm755 "$srcdir/$_pkgname-x86_64.AppImage" "$pkgdir/usr/bin/$_pkgname"
    
    # Installing pixmap and desktop files..
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/cosutrainer.png"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
