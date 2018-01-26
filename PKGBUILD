# Maintainer: Jan Magnus Brevik <janmbrevik@gmail.com>

pkgname=gpodder
pkgver=3.10.0
pkgrel=1
pkgdesc='A podcast receiver/catcher'
license=('GPL3')
arch=('any')
url='http://gpodder.org/'
conflicts=('gpodder3' 'gpodder2' 'gpodder-git')
depends=('iproute2' 'pygtk' 'python2-dbus' 'python2-podcastparser' 'python2-mygpoclient')
makedepends=('intltool' 'imagemagick' 'help2man')
optdepends=('libgpod: for ipod support'
            'lame: for converting ogg to mp3'
            'gnome-bluetooth: transfer podcast via bluethooth'
            'pywebkitgtk: html shownotes/flattr integration'
            'python2-eyed3: for ipod support'
            'ffmpeg: transcode audio files to mp3/ogg'
            'mutagen: audio tagging'
            'python2-html5lib: clickable links')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('2303a104690a614935f06f5c6d2ab3ef')
install=gpodder.install

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR=${pkgdir} PREFIX=/usr
}
