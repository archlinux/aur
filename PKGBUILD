# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
# Contributor: <agustinballesteros04@gmail.com>
pkgname=kew
pkgver=3.3.2
pkgrel=1
pkgdesc="A terminal music player"
arch=('x86_64')
url="https://github.com/ravachol/kew"
license=('GPL-2.0-only')
depends=('fftw' 'chafa' 'glib2' 'opus' 'opusfile' 'libvorbis' 'taglib' 'libogg')
optdepends=('faad2: AAC decoding')
replaces=('cue-music-command')
conflicts=('kew-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('0bc22ff5544881d0ff387bf3a63d74275227a056b3ea87273f29263cd24420276ff72a24d1f482418c95396049cd0a739ba91f9220684e012ba0f06cd38d5347')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 kew "$pkgdir/usr/bin/kew"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "AUTHORS.md" "$pkgdir/usr/share/doc/${pkgname}/AUTHORS.md"
    install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "docs/kew.1" "$pkgdir/usr/share/man/man1/kew.1"
}
