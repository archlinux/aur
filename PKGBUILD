# Maintainer: gmes78 <joaquim dot monteiro at protonmail dot com>

pkgname=python-aiohttp-socks-git
pkgver=v0.7.0.r0.g6936737
pkgrel=1
pkgdesc="Proxy connector for aiohttp. Supports SOCKS4(a), SOCKS5, HTTP (tunneling) as well as proxy chains. (Git version)"
arch=(any)
url="https://github.com/romis2012/aiohttp-socks"
license=("Apache")

depends=("python" "python-aiohttp" "python-python-socks")
makedepends=("git" "python-setuptools")
provides=("python-aiohttp-socks")
conflicts=("python-aiohttp-socks")

source=("git+https://github.com/romis2012/aiohttp-socks.git")
sha512sums=("SKIP")

pkgver() {
    cd "aiohttp-socks"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "aiohttp-socks"
    python setup.py install --root="$pkgdir/" --optimize=1
}
