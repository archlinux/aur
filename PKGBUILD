# Contributor: Vasil Yonkov < bustervill at fastmail dot fm >
#
# This is the Debian package build of bs1770gain. It has a rewritten
# build system, made to use autotools and not download arbitrary stuff
# from the internet.
#
# This source is maintained under the umbrella of Debian Multimedia.

_pkgname=bs1770gain
pkgname=bs1770gain-debian-git
pkgver=0.4.5
pkgrel=1
pkgdesc='A loudness scanner compliant with ITU-R BS.1770.'
arch=('x86_64')
url='http://bs1770gain.sourceforge.net'
license=('GPL2')
depends=('ffmpeg' 'sox')
makedepends=('git')
source=('bs1770gain::git+https://anonscm.debian.org/git/pkg-multimedia/bs1770gain.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe | cut -d'/' -f2 | cut -d'-' -f1
}

build() {
    cd "$_pkgname"

    ./configure --prefix=/usr
    make
}

package() {
    cd "$_pkgname"

    make DESTDIR="$pkgdir/" install
}
