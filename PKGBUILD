# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Tom Richards <tom [at] tomrichards [dot] net>

pkgname=caddy
pkgver=0.7.5
pkgrel=2
pkgdesc="A configurable, general-purpose HTTP/2 web server for any platform"
arch=('i686' 'x86_64' 'armv6h')
url="https://caddyserver.com"
license=('Apache')
install='caddy.install'
conflicts=('caddy-git')

[ "$CARCH" = 'i686' ]   && _suffix='386'   && _md5='21317612e5c0f8da3fee66f2855d4de3'
[ "$CARCH" = 'x86_64' ] && _suffix='amd64' && _md5='9fe55f73b543dc34ab6262171d5d55ef'
[ "$CARCH" = 'armv6h' ] && _suffix='arm'   && _md5='ffe294f09f844a21841a25b0fdf04cd5'
source=("https://github.com/mholt/caddy/releases/download/v$pkgver/caddy_linux_$_suffix.tar.gz")
md5sums=($_md5)

package() {
  install -Dm755 "$srcdir/caddy" "$pkgdir/usr/bin/caddy"
}
