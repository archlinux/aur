# Maintainer: lillywho@outlook.de <lillywho>
pkgname=pihole-openrc
pkgver=0.1
pkgrel=0
epoch=
pkgdesc="An openrc start script for pihole FTL! It's not smart, but it works!"
arch=('any')
url="https://github.com/LillyWho/pihole-FTL-openrc"
license=("GPLv3")
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=("pihole-openrc")
conflicts=()
source=("$pkgname::git://github.com/LillyWho/pihole-FTL-openrc.git")
noextract=()
md5sums=(skip)


pkgver() {
	  cd "$srcdir/$pkgname"
    	  echo "0.$(git rev-list HEAD | wc -l)"
}


package() {
	mkdir -p "$pkgdir"/etc/init.d
	install -m 755 "$srcdir"/"$pkgname"/etc/init.d/pihole-FTL "$pkgdir"/etc/init.d
	return 0
}
