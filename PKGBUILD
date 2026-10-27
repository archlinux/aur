# Maintainer: Tim Alexander Neuenbauer <alex dot kannes222 at gmail dot com>
# Contributor: Soham Sen <aur at sohamsen dot me>
pkgname=python-swspotify
_name=SwSpotify
pkgver=1.2.3
pkgrel=2
pkgdesc="Cross-platform library to get the currently playing song and artist from Spotify w/o using the API or the internet. Very fast."
arch=('any')
url="https://github.com/SwagLyrics/SwSpotify"
license=('MIT')
depends=('python' 'python-flask' 'python-flask-cors' 'python-requests' 'python-dbus')
checkdepends=('python-pytest' 'python-mock')
makedepends=('python-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/SwagLyrics/$_name/archive/v$pkgver.tar.gz")
sha256sums=('7b102edec2994bdee71378cc53352bdc1b540cbac624994b9fb5c77706ebd13f')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}


package() {
    cd "$_name-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
