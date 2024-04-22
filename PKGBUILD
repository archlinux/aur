# Maintainer: gmes78 <gmes.078 at gmail dot com>

_commit="8810ab6c0daf9f537f2c2bb1ce049fbdae7b9f6e"
pkgname=python-aiohttp-proxy
pkgver=0.1.2
pkgrel=2
pkgdesc="SOCKS proxy connector for aiohttp. HTTP, HTTPS, SOCKS4(a) and SOCKS5(h) proxies are supported."
arch=(any)
url="https://github.com/Skactor/aiohttp-proxy"
license=("Apache-2.0")

depends=("python" "python-aiohttp")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")

source=("aiohttp-proxy-${pkgver}::git+https://github.com/Skactor/aiohttp-proxy#commit=${_commit}")
sha512sums=("SKIP")

build() {
    cd "aiohttp-proxy-${pkgver}"
    [[ -d dist/ ]] && rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package() {
    cd "aiohttp-proxy-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
