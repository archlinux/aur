# Contributor: Sean Starnes <seanstar12@gmail.com>
# Maintainer: Sean Starnes <seanstar12@gmail.com>

pkgname=dragondisk
pkgver=1.0.5
pkgrel=0
pkgdesc="DragonDisk, a free-as-in-beer Amazon S3 GUI client"
arch=(i686 x86_64)
url="http://www.dragondisk.com/"
license=('custom')
depends=(qt4 libstdc++5 zlib openssl)
makedepends=()

if [ "$CARCH" == i686 ]; then
  source=("https://s3.amazonaws.com/bilkueclinlcejcfgdfitnhdnnjhuvteju-dragon/dragondisk_1.0.5-0ubuntu_i386.deb")
  sha256sums=('bee5e3c578d89af2104db48ef360911aee8487e94be9cd48732c09224c699195')
elif [ "$CARCH" == x86_64 ]; then
  source=("https://s3.amazonaws.com/bilkueclinlcejcfgdfitnhdnnjhuvteju-dragon/dragondisk_1.0.5-0debian_amd64.deb")
  sha256sums=('c57afda11cdebbb2f0b4ac8e240716afd0dcc31f59de763dad0f3e91929eb569')
fi

package() {
  cd "$srcdir" || exit 1
  tar -xvf data.tar.gz

  install -D -m755 "$srcdir/usr/bin/dragondisk" "$pkgdir/usr/bin/dragondisk"

  install -D -m644 "$srcdir/usr/share/applications/dragondisk.desktop" "$pkgdir/usr/share/applications/dragondisk.desktop"
  install -D -m644 "$srcdir/usr/share/doc/dragondisk/changelog.Debian.gz" "$pkgdir/usr/share/doc/dragondisk/changelog.Debian.gz"
  install -D -m644 "$srcdir/usr/share/doc/dragondisk/copyright" "$pkgdir/usr/share/licenses/dragondisk/LICENSE"
  install -D -m644 "$srcdir/usr/share/pixmaps/dragondisk.xpm" "$pkgdir/usr/share/pixmaps/dragondisk.xpm"
}
