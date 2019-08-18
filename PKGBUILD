# Maintainer: Mario O.M. <marioortizmanero@gmail.com>
pkgname=spotify-videos
pkgver=1.7.1
pkgrel=1
pkgdesc="Watch Youtube music videos for the currently playing Spotify songs"
arch=("any")
url="https://github.com/marioortizmanero/spotify-music-videos"
license=("MIT")
depends=("python" "glib2" "python-gobject" "gtk3" "youtube-dl" "python-vlc"
         "python-lyricwikia" "python-dbus" "python-requests" "python-six")
makedepends=("python-setuptools")
source=("https://github.com/marioortizmanero/spotify-music-videos/archive/${pkgver}.tar.gz")
md5sums=('cc380a63f20d61125923551cab31e96c')

build() {
    cd $srcdir/spotify-music-videos-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/spotify-music-videos-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
