# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Tom Richards <tom [at] tomrichards [dot] net>

pkgname=caddy
pkgver=0.8.1
pkgrel=1
pkgdesc="A configurable, general-purpose HTTP/2 web server for any platform"
arch=('i686' 'x86_64' 'armv6h')
url="https://caddyserver.com"
license=('Apache')
install='caddy.install'
conflicts=('caddy-git')

[ "$CARCH" = 'i686' ]   && _suffix='386'   && _md5='55787149e13a392313cc90ef06fbca86'
[ "$CARCH" = 'x86_64' ] && _suffix='amd64' && _md5='947eaa98dd168832da04c1f4c2670e1a'
[ "$CARCH" = 'armv6h' ] && _suffix='arm'   && _md5='5b1c6aab36e9a1e389386357a4110af1'

source=("https://github.com/mholt/caddy/releases/download/v$pkgver/caddy_linux_$_suffix.tar.gz"
        'caddy.service')
md5sums=("$_md5"
         '13772e64a93685262018194da32a6f1b')

package() {
  install -Dm755 "$srcdir/caddy" "$pkgdir/usr/bin/caddy"
  install -Dm644 "${srcdir}/caddy.service" "${pkgdir}/usr/lib/systemd/system/caddy.service"
}
