# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: kngfr <9bcfbc1ca230857ba09584697f20708a@kngfr.de>
pkgname=spotify_dl
_pkgname=spotify-dl
pkgver=8.2.0
pkgrel=1
pkgdesc="Downloads songs from your Spotify Playlist"
arch=('any')
url="https://github.com/SathyaBhat/spotify-dl"
license=('MIT')
depends=('python-spotipy' 'python-google-api-python-client' 'youtube-dl')
depends=('python-sentry_sdk' 'yt-dlp' 'python-spotipy' 'python-mutagen' 'python-rich')
source=("https://files.pythonhosted.org/packages/de/7a/ec1fc69d1a45bd2ec1a3fd0d46a14fa0adb3e9aa761269e478fac588a00f/spotify_dl-${pkgver}.tar.gz")
sha256sums=('fc2344c5c9f1f289a781487d4d6276915d632277cddffcd93660ff39d26cbbfb')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

