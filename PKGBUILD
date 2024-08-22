# Maintainer: IP2Location <support@ip2location.io>
pkgname=ip2proxy-python
pkgver=3.4.0  # Replace with the actual latest version
pkgrel=1
pkgdesc="Python library for IP2Proxy database lookup. It can be used to find the IP addresses which are used as VPN anonymizer, open proxies, web proxies and Tor exits."
arch=('any')
url="https://github.com/ip2location/ip2proxy-python"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ip2location/ip2proxy-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d410b1d1790dc9214ade7b4f323e90f3ab5b942c3cbbd972a754684b35378ec0')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # Build the wheel
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Use python -m installer to install into the package directory
    python -m installer --destdir="$pkgdir" dist/*.whl
}
