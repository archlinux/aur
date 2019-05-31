# Maintainer Christopher Hasse <hasse dot christopher at gmail dot com>

_pkgname=mopidy-spotify
pkgname=${_pkgname}-playlist-fix-git
pkgver=v1.0.0.r409.gc043290
pkgrel=1
pkgdesc="Mopidy extension for playing music from Spotify"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
    'mopidy>=2'
    'python2-pykka>=1.1'
    'python2-pyspotify>=2'
    'python2-setuptools'
    'python2-requests>=2')
makedepends=('python2' 'git')
provides=('mopidy-spotify')
source=("git+https://github.com/kingosticks/mopidy-spotify.git#branch=fix/web-api-playlists-v2")
md5sums=('SKIP')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
