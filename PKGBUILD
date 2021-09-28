# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Kyle McNally <kyle@kmcnally.net>
# Contributor: Matt Aitchison

pkgname=('plex-sub-zero')
pkgver=2.6.5.3268
pkgrel=3
pkgdesc='Subtitles for Plex, as good you would expect them to be'
arch=('any')
url='https://github.com/pannal/Sub-Zero.bundle'
license=('MIT')
options=('!strip')
depends=('python' 'plex-media-server')
source=("https://github.com/pannal/Sub-Zero.bundle/releases/download/${pkgver}/Sub-Zero.bundle-${pkgver}.zip")
sha256sums=('a32faac6cfc1d81898002c81b71b93ee63f216cb4e56f8e5dd3147569260e62b')

package() {
	install -D -m644 "${srcdir}/Sub-Zero.bundle/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/var/lib/plex/Plex Media Server/Plug-ins/Sub-Zero.bundle"
	cp -r "${srcdir}/Sub-Zero.bundle"/* "${pkgdir}/var/lib/plex/Plex Media Server/Plug-ins/Sub-Zero.bundle/"
}
