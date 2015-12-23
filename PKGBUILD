# Maintainer: Sam Williams <samuel.ecwilliams on Gmail> 
pkgname=music_dropper-git
pkgver=4
pkgrel=1
pkgdesc="A simple method of moving music from your PC, onto your Windows Phone device, over wireless (including automatic conversion)."
arch=('any')
url="https://github.com/samcamwilliams/music_dropper.git"
license=('GPLv2')
depends=('ffmpeg' 'erlang' 'curl')
optdepends=('flac: for automatic conversion of FLAC to 320kbps MP3')
makedepends=('git')
source=('git+https://github.com/samcamwilliams/music_dropper.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/music_dropper"
  # Use the tag of the last commit
  git rev-list --count HEAD
}

package() {
  cd "$srcdir/music_dropper"
  install -m755 -D music_dropper $pkgdir/usr/bin/music_dropper
}
