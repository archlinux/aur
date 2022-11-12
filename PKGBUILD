# Maintainer: Filipe Cruz <filipecruz@tuta.io>
_pkgname=playlist-maker
_binname=pl-mker
_pkgver=0.2.0
pkgname=playlist-maker-rs-bin
pkgver=0.2.0.r0.gd688126
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
sha256sums=('c40d0fff8839d4996220302a398a0db1fe696c3274c6e85508bfd82206bab4ce'
            'cf2becda1336fa7cb20210f63f91c8256e964b6c39d51f8b1ab02918b93522b1'
	    '3534b24795e056d03c7fab25730fa9d740923bfab9ab4665edda862d71a41a61'
	    'a7e60eb195e59f390f8b8d52d75410a2561c6b40bfa5b04d0ebf4556f30e4656'
)

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_binname"
  install -Dm644 "pl-mker.zsh" "$pkgdir/usr/share/zsh/site-functions/_pl-mker"
  install -Dm644 "pl-mker.bash" "$pkgdir/etc/bash_completion.d/pl-mker"
  install -Dm644 "pl-mker.fish" "$pkgdir/usr/share/fish/vendor_completions.d/pl-mker.fish"
}
