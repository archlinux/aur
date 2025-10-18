# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
# Contributor: <agustinballesteros04@gmail.com>
pkgname=kew
pkgver=3.6.2
pkgrel=1
pkgdesc="A terminal music player"
arch=('x86_64')
url="https://github.com/ravachol/kew"
license=('GPL-2.0-only')
depends=('fftw' 'chafa' 'glib2' 'opus' 'opusfile' 'libvorbis' 'taglib' 'libogg' 'faad2')
replaces=('cue-music-command')
conflicts=('kew-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('93a7d6351c713b5d3f779f07752d0bf64dfb15602f7202d8d3881cd3ea4f5189170d7061bd11091726de3f56df370484e2da4074bbc3c99eab4f6e7fffb618ce')

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
