# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
# Contributor: <agustinballesteros04@gmail.com>
pkgname=cue-music-command
pkgver=1.4
pkgrel=2
pkgdesc="A command-line music player"
arch=('x86_64')
url="https://github.com/ravachol/cue"
license=('GPL2')
depends=('ffmpeg' 'fftw' 'git' 'chafa' 'freeimage')
conflicts=('cue-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('852686e9e44c821c1d1276a20037b20c94e7031519687a11fda860b32136af9b0da3fa23d005f89fb0ecf5521506682481b3b3e6945a434e1727088641754e5f')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 cue "$pkgdir/usr/bin/cue"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "docs/cue.1" "$pkgdir/usr/share/man/man1/cue.1"
}
