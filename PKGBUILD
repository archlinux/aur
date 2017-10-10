 # Maintainer: Sebastian Weisgerber <sweisgerber.dev@gmail.com>
pkgname=synology-note-station
pkgver=2.0.220
pkgrel=1
pkgdesc="Note Station for desktop connects you with Note Station on your Synology NAS. You can manage all the notes/to-do list offline, right from your local computer."
arch=('x86_64')
url="https://www.synology.com/support/download/"
license=('(C) Synology: Proprietary')
depends=('')
makedepends=('rpmextract')
options=('emptydirs')
source=("https://global.download.synology.com/download/Tools/NoteStationClient/2.0.220/Fedora/x86_64/synology-note-station-2.0.220-linux-x86_64.rpm")
md5sums=('7fb9ddfb7b9d3bfc4190a36b3ab73a97')

build() {
  rpmextract.sh synology-note-station-2.0.220-linux-x86_64.rpm
}

package() {
    rsync -ruDq $srcdir/opt $pkgdir/
    rsync -ruDq $srcdir/usr $pkgdir/
}
