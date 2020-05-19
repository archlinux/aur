pkgname=trojan-go-git
_pkgname=trojan-go
pkgver=0.4.10.r0.ga661696
pkgrel=1
pkgdesc="A Trojan proxy written in Go (git version)."
arch=(x86_64)
url="https://github.com/p4gefau1t/trojan-go"
license=(MIT)
depends=(glibc)
makedepends=(go-pie git)
provides=(trojan-go)
conflicts=(trojan-go)
source=("$_pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir"/$_pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir"/$_pkgname
    go build -o trojan-go .
}


package() {
    cd "$srcdir"/$_pkgname

    install -Dm755 "$srcdir"/$_pkgname/trojan-go -t "$pkgdir"/usr/bin/
}
