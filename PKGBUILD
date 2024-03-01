# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
# Contributor: <agustinballesteros04@gmail.com>
pkgname=kew
pkgver=2.4.2
pkgrel=1
pkgdesc="A command-line music player"
arch=('x86_64')
url="https://github.com/ravachol/kew"
license=('GPL2')
depends=('ffmpeg' 'fftw' 'chafa' 'freeimage' 'glib2' 'opus' 'opusfile' 'libvorbis')
replaces=('cue-music-command')
conflicts=('kew-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('734885d7494edc10b695dc01565a91997d0e34791aa789b91a8382f57082187b37fd140c7d32e4d673a805ed1a6cf05a21219f4d5729c22c57e5b1af95e52e67')

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
