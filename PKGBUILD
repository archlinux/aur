pkgname=gohpts
_pkgname=go-http-proxy-to-socks
pkgver=1.12.3
pkgrel=1
pkgdesc="Simple CLI tool to transform SOCKS proxy into HTTP proxy with IPv4/IPv6 support for TCP/UDP Transparent Proxy (Redirect and TProxy), Proxychains, ARP/NDP/RA/RDNSS spoofing and Traffic Sniffing "
arch=('any')
url=https://github.com/shadowy-pycoder/go-http-proxy-to-socks
license=('GPLv3')
depends=()
makedepends=('go' 'git')
source=("git+https://github.com/shadowy-pycoder/go-http-proxy-to-socks")

pkgver() {
    cd "$srcdir/$_pkgname"
    sed -n 's/.*v\([0-9.]*\)".*/\1/p' version.go
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "./bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
sha256sums=('SKIP')
