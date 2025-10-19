# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
# Contributor: <agustinballesteros04@gmail.com>
pkgname=kew
pkgver=3.6.3
pkgrel=1
pkgdesc="A terminal music player"
arch=('x86_64')
url="https://github.com/ravachol/kew"
license=('GPL-2.0-only')
depends=('fftw' 'chafa' 'glib2' 'opus' 'opusfile' 'libvorbis' 'taglib' 'libogg' 'faad2')
replaces=('cue-music-command')
conflicts=('kew-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('66a31b3e5ee0254a2407cbecf0f142c1b7eddf0ec9cdf6739e3dd8b6329ec18c1134ba71d3336728a84cad6d2b6c64c454508cc8ddb65657207046ac6d7a7904')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 kew "$pkgdir/usr/bin/kew"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "docs/AUTHORS.md" "$pkgdir/usr/share/doc/${pkgname}/AUTHORS.md"
    install -Dm644 "docs/CHANGELOG.md" "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "docs/kew.1" "$pkgdir/usr/share/man/man1/kew.1"
}
