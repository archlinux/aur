# Maintainer: <agustinballesteros04@gmail.com>
pkgname=cue-git
pkgver=v1.8.1.r1.g02206a4
pkgrel=1
pkgdesc="A command-line music player"
arch=('x86_64')
url="https://github.com/ravachol/kew"
license=('GPL2')
depends=('ffmpeg' 'fftw' 'git' 'chafa' 'freeimage' 'gcc' 'make' 'glib2' 'opus' 'opusfile' 'libvorbis')
sha256sums=('SKIP')

source=("git+${url}")

pkgver() {
    cd "$srcdir/kew"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/kew"
    make
}

package() {
    cd "$srcdir/kew"
    install -Dm755 kew "$pkgdir/usr/bin/kew"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/kew/docs/kew-manpage.mdoc" "$pkgdir/usr/share/man/man1/kew.1"
}

