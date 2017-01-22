# Maintainer: Akimoge <admin@orosu.eu>
# Contributor: Brostrix

pkgname=myanimelist_client
pkgver=0.1
pkgrel=1
pkgdesc="Simple MyAnimeList client"
arch=('any')
url=""
license=('GPL')
depends=('ruby' 'curl')
optdepends=()
provides=()
source=("https://github.com/Akimoge/myanimelist-client/releases/download/0.1/MyAnimeList_client-0.1.tar.gz")
md5sums=('4bcf00d0546d2ba481ba7c825bedae05')

package() {
	mkdir -p ${pkgdir}/etc/mal
	cd ${srcdir}
	gem install myanimelist_client
	gem install nokogiri
	gem install json
	install -Dm755 anime "${pkgdir}/usr/bin/anime"
	install -Dm644 config.json "${pkgdir}/etc/mal/config.json"
}
