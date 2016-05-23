# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>
# Contributor: Keerthan Jaic <jckeerthan at gmail dot com

pkgname=nuvolaplayer-git
pkgver=3.0.0.r38.g4d5feb9
pkgrel=1

arch=('i686' 'x86_64')
license=('GPL')
pkgdesc='Cloud music integration for your Linux desktop.'
url='https://tiliado.eu/nuvolaplayer/'

source=("$pkgname::git://github.com/tiliado/nuvolaplayer")
sha256sums=('SKIP')

depends=('diorite-git' 'webkit2gtk' 'libarchive')
makedepends=('git' 'python' 'vala')
optdepends=('nuvola-app-amazon-cloud-player-git:   Amazon Music integration'
            'nuvola-app-bandcamp-git:              BandCamp integration'
            'nuvola-app-deezer-git:                Deezer integration'
            'nuvola-app-google-play-music-git:     Google Play Music integration (requires Flash)'
            'nuvola-app-groove-git:                Microsoft Groove integration'
            'nuvola-app-jango-git:                 Jango integration'
            'nuvola-app-kexp-git:                  KEXP Radio integration'
            'nuvola-app-logitech-media-server-git: Logitech Media Server integration'
            'nuvola-app-mixcloud-git:              MixCloud integration'
            'nuvola-app-owncloud-music-git:        OwnCloud Music integration'
            'nuvola-app-plex-git:                  Plex integration'
            'nuvola-app-soundcloud-git:            SoundCloud integration'
            'nuvola-app-spotify-git:               Spotify integration'
            'nuvola-app-tunein-git:                TuneIn integration'
            'nuvola-app-yandex-music-git:          Yandex.Music integration'
            'nuvola-app-google-calendar-git:       Google Calendar apps integration (experimental)'
            'nuvola-app-8tracks-git:               8tracks integration (not functional)'
            'nuvola-app-hype-machine-git:          Hype Machine integration (not functional)'
            'nuvola-app-pandora-git:               Pandora integration (not functional)' )

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python ./waf configure --prefix=/usr
	python ./waf build
}

package() {
	cd "$pkgname"
	python ./waf install --no-system-hooks --destdir="${pkgdir}"
}
