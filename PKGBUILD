# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
# Contributor: <agustinballesteros04@gmail.com>
pkgname=kew
pkgver=3.0.0
pkgrel=1
pkgdesc="A terminal music player for Linux"
arch=('x86_64')
url="https://github.com/ravachol/kew"
license=('GPL-2.0-only')
depends=('fftw' 'chafa' 'glib2' 'opus' 'opusfile' 'libvorbis' 'taglib' 'libogg')
optdepends=('libnotify: Native notification support'
            'faad2: AAC decoding')
replaces=('cue-music-command')
conflicts=('kew-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c8dbdfcb3ed2e63e8eaeb4fb51bce64b19f4f968da9f6563a075a5479ff396760ea552fcd6791f482948a43b61d71acfdc9178579f565922bfb524bf669064f8')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 kew "$pkgdir/usr/bin/kew"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "docs/kew.1" "$pkgdir/usr/share/man/man1/kew.1"
}
