# Maintainer: Helle Vaanzinn <glitsj16@riseup.net>

# unfuck ttf-ubuntu-font-family
# https://bugs.archlinux.org/task/77966
# credit to original maintainer
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=ttf-ubuntu-font-family-0.83
pkgver=0.83
pkgrel=1
pkgdesc="Ubuntu font family - 0.83 edition"
arch=(any)
url="https://design.ubuntu.com/font/"
license=('custom:Ubuntu Font Licence 1.0')
provides=(ttf-ubuntu-font-family)
conflicts=(ttf-ubuntu-font-family)
source=(https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-$pkgver.zip
    81-ubuntu.conf)
sha256sums=('456d7d42797febd0d7d4cf1b782a2e03680bb4a5ee43cc9d06bda172bac05b42'
            '16e29b1b8d13edddb588e4470f6da4c15870a9a27dd25eb4553c2c575d6dc14e')

package() {
	cd "ubuntu-font-family-$pkgver"

	install -Dm644 *.ttf -t "$pkgdir"/usr/share/fonts/ubuntu
	install -Dm644 LICENCE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
	install -Dm644 "$srcdir"/81-ubuntu.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail
	install -dm755 "$pkgdir"/usr/share/fontconfig/conf.default
	ln -s ../conf.avail/81-ubuntu.conf "$pkgdir"/usr/share/fontconfig/conf.default/81-ubuntu.conf
}
