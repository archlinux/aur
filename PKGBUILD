# Maintainer: gandalf3 <zzyxpaw at gmail dot com>
# Contributor: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-spotify-git
_pkgname="mopidy-spotify"
pkgver=576.984151a
pkgrel=1
pkgdesc="Mopidy extension for playing music from Spotify (git version)"
arch=('any')
url="https://github.com/mopidy/mopidy-spotify"
license=('APACHE')
conflicts=('mopidy-spotify')
provides=('mopidy-spotify')
depends=(
  'mopidy>=3.4'
  python-pykka
  python-requests
  gst-plugins-rs
)
makedepends=(
  python-setuptools
)
install=mopidy-spotify.install
source=(git+https://github.com/mopidy/mopidy-spotify.git)
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


package() {
  cd "$srcdir/${_pkgname}"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

