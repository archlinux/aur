# Maintainer: Karol Babioch <karol@babioch.de

pkgname=aaxtomp3-git
pkgver=1.1.r83.g3c7a5f1
pkgrel=1
pkgdesc="Convert Audible's .aax filetype to MP3, FLAC, M4A, or OPUS"
arch=('any')
url='https://github.com/KrumpetPirate/AAXtoMP3'
license=('custom')
depends=('ffmpeg' 'bc')
optdepends=('libmp4v2')
makedepends=('git')
provides=('aaxtomp3')
conflicts=('aaxtomp3')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm 755 AAXtoMP3 "$pkgdir/usr/bin/AAXtoMP3"
    install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

