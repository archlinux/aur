# Maintainer: Filipe Cruz <filipecruz@tuta.io>
_pkgname=playlist-maker
_binname=pl-mker
_pkgver=0.5.0
pkgname=playlist-maker-rs-bin
pkgver=$_pkgver
pkgrel=1
pkgdesc='M3u playlist creator that uses query-like statments to find the requested songs, implemented in Rust: binary version'
arch=('i686' 'x86_64')
url="https://github.com/FilipeMCruz/playlist-maker"
rawurl="https://raw.githubusercontent.com/FilipeMCruz/playlist-maker"
license=('MIT')
makedepends=('cargo')
conflicts=('playlist-maker-rs')
provides=('playlist-maker-rs')
source=("$pkgver.tar.gz::$url/releases/download/v$_pkgver/$_pkgname-x86_64-unknown-linux-musl.tar.gz"
        "$_binname.zsh::$rawurl/master/autocompletions/_pl-mker"
	"$_binname.bash::$rawurl/master/autocompletions/pl-mker.bash"
	"$_binname.fish::$rawurl/master/autocompletions/pl-mker.fish"
)
sha256sums=('e4352ac2485c0c778d2392621d6dab0851ab5abc5c484f8b6b1cafc899ca8e13'
            '9ec1f70ffd5b2ad549984f9cf412392515ba0b591a45d335be94412218d1fa17'
	    '3822f7ce5359c3749d17b5954fc580a9d64ac1e550a3632306bea6a86a771002'
	    '2853f86cf95199ad8bd4c41cbf0cc3275668a8d8f5722084a0fb7d2a09dfcdd1'
)

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_binname"
  install -Dm644 "pl-mker.zsh" "$pkgdir/usr/share/zsh/site-functions/_pl-mker"
  install -Dm644 "pl-mker.bash" "$pkgdir/etc/bash_completion.d/pl-mker"
  install -Dm644 "pl-mker.fish" "$pkgdir/usr/share/fish/vendor_completions.d/pl-mker.fish"
}
