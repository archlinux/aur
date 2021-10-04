# Maintainer:  Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Alexander Minges <alexander.minges@gmail.com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Andrzej Wąsowski <wasowski@data.pl>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>
# Contributor: Vo Van Hong Ngoc <vhngoc@ubuntu-vn.org>

pkgname=rawdog
pkgver=2.23
pkgrel=2

pkgdesc="RSS Aggregator Without Delusions Of Grandeur"
url="https://offog.org/code/rawdog.html"
arch=('any')
license=('GPL' 'LGPL')

depends=('python2-feedparser')

install=rawdog.install

source=("https://offog.org/files/rawdog-$pkgver.tar.gz")

sha1sums=('171520c909fae81ac8ec0e063e7ca36593aae372')

build() {
	cd rawdog-"$pkgver"

	python2 setup.py build
}

package() {
	cd rawdog-"$pkgver"

	python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	install -Dm644 config "$pkgdir/usr/share/$pkgname/config"
	install -Dm644 style.css "$pkgdir/usr/share/$pkgname/style.css"
}
