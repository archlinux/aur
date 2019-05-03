# Maintainer: Sebastian Weisgerber <sweisgerber.dev@gmail.com>
pkgname=synology-note-station
pkgver=2.1.5_259
pkgrel=3
pkgdesc="Note Station for desktop connects you with Note Station on your Synology NAS. You can manage all the notes/to-do list offline, right from your local computer."
arch=('i686' 'x86_64')
url="https://www.synology.com/support/download/"
license=('(C) Synology: Proprietary')
depends=('ffmpeg' 'gtk3' 'libxss' 'nss')
makedepends=('rpmextract')
options=('emptydirs')
# https://www.synology.com/en-us/support/download/DS216
if [[ ${CARCH} == "i686" ]]; then
    source=("https://global.download.synology.com/download/Tools/NoteStationClient/${pkgver/_/-}/Fedora/i686/synology-note-station-${pkgver/_/-}-linux-i386.rpm")
    md5sums=('616fe29d7f827aa8bf120185e4e173d7')
elif [[ ${CARCH} == "x86_64" ]]; then
    source=("https://global.download.synology.com/download/Tools/NoteStationClient/${pkgver/_/-}/Fedora/x86_64/synology-note-station-${pkgver/_/-}-linux-x86_64.rpm")
    md5sums=('3011f41d44fa64a662fda9eae4c04033')
fi

package() {
    cp -rf $srcdir/opt $pkgdir/
    cp -rf $srcdir/usr $pkgdir/
}
