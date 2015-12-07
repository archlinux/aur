# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Tom Richards <tom [at] tomrichards [dot] net>

pkgname=caddy
pkgver=0.8.0
pkgrel=1
pkgdesc="A configurable, general-purpose HTTP/2 web server for any platform"
arch=('i686' 'x86_64' 'armv6h')
url="https://caddyserver.com"
license=('Apache')
install='caddy.install'
conflicts=('caddy-git')

[ "$CARCH" = 'i686' ]   && _suffix='386'   && _md5='3bae9a2eae8a8cb0088544b0d5aceebb'
[ "$CARCH" = 'x86_64' ] && _suffix='amd64' && _md5='a09630333fd97da4b27c16586e0b115f'
[ "$CARCH" = 'armv6h' ] && _suffix='arm'   && _md5='9e0c466deeb891c22c3156763530589e'

source=("https://github.com/mholt/caddy/releases/download/v$pkgver/caddy_linux_$_suffix.tar.gz")
md5sums=($_md5)

package() {
  install -Dm755 "$srcdir/caddy" "$pkgdir/usr/bin/caddy"
}
