# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Tom Richards <tom [at] tomrichards [dot] net>

pkgname=caddy
pkgver=0.6.0
pkgrel=1
pkgdesc="A configurable, general-purpose HTTP/2 web server for any platform"
arch=('i686' 'x86_64' 'armv6h')
url="https://caddyserver.com"
license=('Apache')
install='caddy.install'
conflicts=('caddy-git')

[ "$CARCH" = 'i686' ]   && _suffix='386'   && _md5='5495993bb011a2a86ba903ff9e015bcf'
[ "$CARCH" = 'x86_64' ] && _suffix='amd64' && _md5='aebc0006e2206b9fc0500e3e1d6f7626'
[ "$CARCH" = 'armv6h' ] && _suffix='arm'   && _md5='a3a613fa48f8ce9f5d137db8c72e2114'
source=("https://github.com/mholt/caddy/releases/download/v$pkgver/caddy_linux_$_suffix.zip")
md5sums=($_md5)

package() {
  install -Dm755 "$srcdir/caddy" "$pkgdir/usr/bin/caddy"
}
