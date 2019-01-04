# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=tldr++
_gitname=tldr
pkgver=0.5.0
pkgrel=1
pkgdesc="Community driven man pages improved with smart user interaction"
arch=('any')
url="http://isacikgoz.me/tldr"
license=('MIT')
makedepends=('go')
provides=('tldr')
conflicts=('tldr' 'tealdeer' 'tldr-bash' 'nodejs-tldr' 'tldr-go-client' 'tldr-cpp' 'tldr-python-client')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/isacikgoz/tldr/archive/v$pkgver.tar.gz")
md5sums=('40e3eabc37c767544d907f0a65f364fd')

build() {
	cd "$_gitname-$pkgver"
	go get -u github.com/isacikgoz/tldr
	go build
}

package() {
	cd "$_gitname-$pkgver"
	install -Dm755 "$_gitname-$pkgver" "$pkgdir"/usr/bin/tldr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
