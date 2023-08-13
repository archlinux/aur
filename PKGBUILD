# Maintainer: kotontrion <kotontrion@tutanota.de>
# Contributor: Letu Ren <fantasquex@gmail.com>
# Contributor: kngfr <9bcfbc1ca230857ba09584697f20708a@kngfr.de>
pkgname=spotify_dl
pkgver=8.8.2
pkgrel=1
pkgdesc="Downloads songs from your Spotify Playlist"
arch=('any')
url="https://github.com/SathyaBhat/spotify-dl"
license=('MIT')
depends=('python-spotipy' 'python-google-api-python-client' 'youtube-dl')
depends=('python-sentry_sdk' 'yt-dlp' 'python-spotipy' 'python-mutagen' 'python-rich')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('13821fd782ffee43671b422a82ebf0640ddcbb3f2fc3897bb2727cd822f67b14')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


