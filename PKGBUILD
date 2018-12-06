# Maintainer: Sebastian Weisgerber <sweisgerber.dev@gmail.com>
pkgname=synology-note-station
pkgver=2.1.4_245
pkgrel=2
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
    md5sums=('47fac020bd4724724b880b0c6a382c00')
elif [[ ${CARCH} == "x86_64" ]]; then
    source=("https://global.download.synology.com/download/Tools/NoteStationClient/${pkgver/_/-}/Fedora/x86_64/synology-note-station-${pkgver/_/-}-linux-x86_64.rpm")
    md5sums=('f1a9d10c8a4c5a61782c7fc7f4208ec0')
fi

package() {
    cp -rf $srcdir/opt $pkgdir/
    cp -rf $srcdir/usr $pkgdir/
}
