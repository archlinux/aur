# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=tldr++
_gitname=tldr
pkgver=0.6.1
pkgrel=1
pkgdesc="Community driven man pages improved with smart user interaction"
arch=('any')
url="http://isacikgoz.me/tldr"
license=('MIT')
makedepends=('go')
provides=("$_gitname")
conflicts=('tldr-bash' 'nodejs-tldr' 'tldr-python-client')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/isacikgoz/$_gitname/archive/v$pkgver.tar.gz")
sha256sums=('e377942c6dd9cbe3f9f55b7614e17b7c5f0694b326ad3993d0cde59aca8dc8fa')

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
