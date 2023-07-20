# Maintainer: Your Name <agustinballesteros04@gmail.com>
pkgname=cue-git
pkgver=v0.9.18.r0.gf480731
pkgrel=1
pkgdesc="A command-line music player"
arch=('x86_64')
url="https://github.com/ravachol/cue"
license=('GPL')
depends=('ffmpeg' 'fftw' 'git' 'chafa' 'freeimage')
sha256sums=('SKIP')

source=("git+${url}")

pkgver() {
    cd "$srcdir/cue"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/cue"
    make
}

package() {
    cd "$srcdir/cue"
    install -Dm755 cue "$pkgdir/usr/local/bin/cue"
}

# Add post_install and post_upgrade functions if needed
# post_install() {
#     # Do something after installation
# }
#
# post_upgrade() {
#     # Do something after upgrading the package
# }
