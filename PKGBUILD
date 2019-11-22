# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-aiohttp-proxy-git
pkgver=v0.1.1.r0.g131c0e4
pkgrel=1
pkgdesc="SOCKS proxy connector for aiohttp. HTTP, HTTPS, SOCKS4(a) and SOCKS5(h) proxies are supported. (Git version)"
arch=(any)
url="https://github.com/Skactor/aiohttp-proxy"
license=("Apache")

depends=("python" "python-aiohttp")
makedepends=("git" "python-setuptools")
provides=("python-aiohttp-proxy")
conflicts=("python-aiohttp-proxy")

source=("git+https://github.com/Skactor/aiohttp-proxy.git")
sha512sums=("SKIP")

pkgver() {
    cd "aiohttp-proxy"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "aiohttp-proxy"
    python setup.py install --root="$pkgdir/" --optimize=1
}
