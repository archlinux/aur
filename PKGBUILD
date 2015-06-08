# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Tom Richards <tom [at] tomrichards [dot] net>

pkgname=caddy
pkgver=0.7.1
pkgrel=1
pkgdesc="A configurable, general-purpose HTTP/2 web server for any platform"
arch=('i686' 'x86_64' 'armv6h')
url="https://caddyserver.com"
license=('Apache')
install='caddy.install'
conflicts=('caddy-git')

[ "$CARCH" = 'i686' ]   && _suffix='386'   && _md5='2d70f2d34abcdc796c965bb965d65162'
[ "$CARCH" = 'x86_64' ] && _suffix='amd64' && _md5='4c48e8cf42d635a889f5a9e09d45a79b'
[ "$CARCH" = 'armv6h' ] && _suffix='arm'   && _md5='4c7c4557ac281396d492dd4b5a64490d'
source=("https://github.com/mholt/caddy/releases/download/v$pkgver/caddy_linux_$_suffix.zip")
md5sums=($_md5)

package() {
  install -Dm755 "$srcdir/caddy" "$pkgdir/usr/bin/caddy"
}
