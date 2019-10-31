# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=360zip
pkgver=1.0.0.1010
pkgrel=4
pkgdesc="360 Archiving Tool"
arch=('x86_64')
url="http://yasuo.360.cn/"
license=('custom')
depends=(
    'qt5-base'
)
source=(
    "https://packages.deepin.com/deepin/pool/non-free/3/360zip/360zip_${pkgver}_amd64.deb"
)
sha512sums=(
    '62a46ef491f91378d4c9d9f645eb72610eebc5180c1a988bccec9b3a87e46d7ed3c9c1f7bce214c72d269cafad1337d2a3db96f638fbfa3739fce95e3cb394eb'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/share"
    mv "$pkgdir/usr/local/share/360zip" "$pkgdir/usr/share/360zip"
    mv "$pkgdir/usr/local/share/applications" "$pkgdir/usr/share/applications"

    mkdir -p "$pkgdir/usr/share/icons"
    ln -s "$pkgdir/usr/local/share/360zip.png" "$pkgdir/usr/share/icons/360zip.png"

    mv "$pkgdir/usr/lib/x86_64-linux-gnu/dde-file-manager" "$pkgdir/usr/lib/dde-file-manager"
    rmdir "$pkgdir/usr/lib/x86_64-linux-gnu"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /usr/share/360zip/360zip.sh "$pkgdir/usr/bin/360zip"
}
