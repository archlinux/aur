# Maintainer:  avkonarev <avkonarev@gmail.com>

pkgname=nuvolaplayer_3.0
_pkgname=nuvolaruntime
pkgver=3.0.8
pkgrel=1

arch=('i686' 'x86_64')
license=('GPL')
pkgdesc='Cloud music integration for your Linux desktop stable 3.0 branch.'
url='https://tiliado.eu/nuvolaplayer/'

source=("nuvolaplayer-${pkgver}.tar.gz::https://github.com/tiliado/nuvolaplayer/archive/${pkgver}.tar.gz")
sha256sums=('d160ab23db432ac8ddaa75e3be931a7eb8e70d66f762acc283cb4cb1946dcd30')

depends=('diorite_0.2.x' 'webkit2gtk' 'libarchive')
makedepends=('python' 'vala')
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
