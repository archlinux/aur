# Maintainer: Akimoge <admin@orosu.eu>
# Contributor: Brostrix

pkgname=myanimelist_client
pkgver=1.0
pkgrel=2
pkgdesc="Simple MyAnimeList client"
arch=('any')
url="http://mal.orosu.eu/"
license=('GPL')
depends=('ruby' 'curl')
optdepends=()
provides=()
source=("https://github.com/Akimoge/myanimelist-client/releases/download/1.0/myanimelist-1.0.tar.gz")
md5sums=('1ac54e1f4ff09420373e4942d88b2a1f')

package() {
	mkdir -p ${pkgdir}/etc/mal
	cd ${srcdir}
	gem install myanimelist_client
	gem install nokogiri
	gem install json
	install -Dm755 anime "${pkgdir}/usr/bin/anime"
        install -Dm755 manga "${pkgdir}/usr/bin/manga"
	install -Dm644 config.json "${pkgdir}/etc/mal/config.json"
	echo "\n Please insert your MAL account details to /etc/mal/config.json \n"
}
