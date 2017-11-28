# Maintainer:  avkonarev <avkonarev@gmail.com>

pkgname=nuvolaplayer_3.0
_pkgname=nuvolaruntime
pkgver=3.0.9
pkgrel=1

arch=('i686' 'x86_64')
license=('GPL')
pkgdesc='Cloud music integration for your Linux desktop stable 3.0 branch.'
url='https://tiliado.eu/nuvolaplayer/'

source=("nuvolaplayer-${pkgver}.tar.gz::https://github.com/tiliado/nuvolaplayer/archive/${pkgver}.tar.gz")
sha256sums=('1c226ae331e37041fb5f8740a0a999880adde41cba43c8291ed550bdedf1bb98')

depends=('diorite_0.2.x' 'webkit2gtk' 'libarchive')
makedepends=('python' 'vala')
provides=('nuvolaplayer=3.0.8')
optdepends=(
	'nuvola-app-8tracks:               8tracks.com integration'
	'nuvola-app-amazon-cloud-player:   Amazon Cloud Player integration'
	'nuvola-app-bandcamp:              Bandccamp integration'
	'nuvola-app-deezer:                Deezer integration'
	'nuvola-app-google-play-music:     Google Play Music integration'
	'nuvola-app-groove:                Microsoft Groove Music integration'
	'nuvola-app-jango:                 Jango integration'
	'nuvola-app-logitech-media-server: Logitech Media Server integration'
	'nuvola-app-mixcloud:              Mixcloud integration'
	'nuvola-app-plex:                  Plex Media integration'
	'nuvola-app-soundcloud:            SoundCloud integration'
	'nuvola-app-spotify:               Spotify integration'
	'nuvola-app-tunein:                TuneIn integration'
	'nuvola-app-yandex-music:          Yandex.Music integration'
)

build() {
	cd "${_pkgname}-${pkgver}"
	python ./waf configure --prefix=/usr
	python ./waf build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python ./waf install --no-system-hooks --destdir="${pkgdir}"
}
