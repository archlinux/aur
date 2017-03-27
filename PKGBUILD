# Maintainer: Lukas L <l.levickas@gmail.com>

pkgname=gotwitch
pkgver=1.0
pkgrel=1
pkgdesc="Simple Twitch.tv command-line app to watch and query streams"
arch=(any)
url="https://deluxo.github.io/gotwitch/"
_ghuser="https://github.com/deluxo/"
license=('GPL')
makedepends=('go')
depends=('youtube-dl: http streaming utility')
optdepends=('mpv: for watching a livestream' 'vlc: for  watching a livestream')
options=('!strip' '!emptydirs')
source=("$pkgname::git+$_ghuser$pkgname.git")
md5sums=(SKIP)

build() {
	go build -o "$pkgname"
}

package() {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
