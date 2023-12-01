# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
# Contributor: <agustinballesteros04@gmail.com>
pkgname=kew
pkgver=1.9
pkgrel=1
pkgdesc="A command-line music player"
arch=('x86_64')
url="https://github.com/ravachol/kew"
license=('GPL2')
depends=('ffmpeg' 'fftw' 'chafa' 'freeimage' 'glib2' 'opus' 'opusfile' 'libvorbis')
replaces=('cue-music-command')
conflicts=('kew-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('4b4983d8c3e1ee7b50d7518fa62d9fcc8da6b0880b01ad97d8680611eac0186385bfe9d3bbbab45a1e353a9f32630aedc99d277ef22d23543210335c0d3a88da')

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
