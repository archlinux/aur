# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=tldr++
_gitname=tldr
pkgver=0.5.0
pkgrel=2
pkgdesc="Community driven man pages improved with smart user interaction"
arch=('any')
url="http://isacikgoz.me/tldr"
license=('MIT')
makedepends=('go')
provides=('tldr')
conflicts=('tldr-bash' 'nodejs-tldr' 'tldr-python-client')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/isacikgoz/$_gitname/archive/v$pkgver.tar.gz")
sha256sums=('78e026cbfa2088d205af6bcb80d64e622b410601d4b23f2cca8bdf31054da3f1')

build() {
	cd "$_gitname-$pkgver"
	go get -u "github.com/isacikgoz/$_gitname"
	go build
}

package() {
	cd "$_gitname-$pkgver"
	install -Dm755 "$_gitname-$pkgver" "$pkgdir/usr/bin/$_gitname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
