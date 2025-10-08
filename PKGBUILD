# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
# Contributor: <agustinballesteros04@gmail.com>
pkgname=kew
pkgver=3.5.2
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
sha512sums=('220347ea24e21329e1a448a86f3cffaf91c89198d492efe32ca54b9f3ef4f58dc6fef61c3ef7905aac2a830fa57d2e77f6ff28cd2a95100c7a29a731b1e9bed0')

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
