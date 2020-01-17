# Maintainer: Zhu Chuang <genelocated at yandex dot com>

pkgname=nteract-desktop-bin
pkgver=0.15.0
pkgrel=3
pkgdesc='All the power of Jupyter notebooks, wrapped in a native desktop application.'
arch=('x86_64')
url='https://nteract.io/desktop'
license=('BSD')
conflicts=('nteract-desktop')
depends=('python-ipykernel')
options=('!strip')

source=("https://github.com/nteract/nteract/releases/download/v$pkgver/nteract-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/nteract/nteract/v$pkgver/LICENSE"
        "https://raw.githubusercontent.com/nteract/nteract.io/master/static/icons/android-icon-192x192.png"
        "nteract.desktop")
sha256sums=('cab1da3ba8d325ec8aa7366a5cf75b03a0e5bbde9f24b5f0ac6e3157e0bd7151'
            '866e6fa48cb8810d36d8d85a3085d7aa1c4317d3731f0ef84919428fee87bf71'
            '3d60b13b503d6a74219d260c144c1de01cf3bc71bed47a8842c4ef87615c132d'
            '7ea096d8c58271e272bb559e60679e168115a1834e0f28693c1031dd608ca19c')

package() {
    mkdir -p "$pkgdir/usr/lib/"
    cp -r "$srcdir/nteract-$pkgver/" "$pkgdir/usr/lib/nteract/"
    mkdir -p "$pkgdir/usr/bin/"
    ln -sf "/usr/lib/nteract/nteract" "$pkgdir/usr/bin/nteract"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/nteract/LICENSE"

    install -Dm644 "$srcdir/android-icon-192x192.png" "$pkgdir/usr/share/pixmaps/nteract.png"
    install -Dm644 "$srcdir/nteract.desktop" "$pkgdir/usr/share/applications/nteract.desktop"
}

