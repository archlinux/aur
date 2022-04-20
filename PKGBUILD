# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: kngfr <9bcfbc1ca230857ba09584697f20708a@kngfr.de>
pkgname=spotify_dl
pkgver=8.3.0
pkgrel=1
pkgdesc="Downloads songs from your Spotify Playlist"
arch=('any')
url="https://github.com/SathyaBhat/spotify-dl"
license=('MIT')
depends=('python-spotipy' 'python-google-api-python-client' 'youtube-dl')
depends=('python-sentry_sdk' 'yt-dlp' 'python-spotipy' 'python-mutagen' 'python-rich')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('7817d710d30f3f646cd40d322ba6ff2f81d0a86c16d09cb825d316b7dfb78589')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

