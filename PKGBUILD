# Maintainer: Carl George < arch at cgtx dot us >

_name="caddy"
pkgname="$_name-bin"
pkgver=0.10.2
pkgrel=1
pkgdesc="HTTP/2 web server with automatic HTTPS"
arch=("x86_64")
url="https://caddyserver.com"
license=("Apache")
provides=("$_name")
conflicts=("$_name")
backup=("etc/caddy/Caddyfile")
install="$_name.install"
source=("https://github.com/mholt/caddy/releases/download/v$pkgver/caddy_v${pkgver}_linux_amd64.tar.gz"
        "https://caddyserver.com/resources/images/brand/caddy-at-your-service-white.svg"
        "index.html"
        "caddy.service"
        "caddy.tmpfiles"
        "Caddyfile")
sha256sums=('de7b6a4301bdb5ae5c066e123d71efa9e73156878a43629ced45d8adfe5510c5'
            'e679dd79fd92dc351fc190c7af529c73e3896986aaa6b7c0ae01e561398d6b85'
            '6db7aec45e95bbbf770ce4d120a60d8e4992d2262a8ebf668521179279aa5ae7'
            '97ce7bfe38c268a7ffc316cc8b984eecb6aaac5b988384c9367b46e0ae0b8bff'
            'bd4d912d083be176727882ccc1bbe577a27cc160db09238e5edc05ba458aebce'
            '4e30255be85d3b4f138860f61264aea3960d8873955d3a96eb8e39f1baf9aa65')

package() {
    install --verbose -D --mode 0755 caddy "$pkgdir/usr/bin/caddy"
    install --verbose -D --mode 0644 caddy.service "$pkgdir/usr/lib/systemd/system/caddy.service"
    install --verbose -D --mode 0644 caddy.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/caddy.conf"
    install --verbose -D --mode 0644 Caddyfile "$pkgdir/etc/caddy/Caddyfile"
    install --verbose -D --mode 0644 index.html "$pkgdir/usr/share/caddy/index.html"
    install --verbose -D --mode 0644 caddy-at-your-service-white.svg "$pkgdir/usr/share/caddy/caddy-at-your-service-white.svg"
}
