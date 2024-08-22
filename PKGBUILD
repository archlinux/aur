# Maintainer: IP2Location <support@ip2location.io>
pkgname=IP2Location-Python
pkgver=8.10.2  # Replace with the actual latest version
pkgrel=1
pkgdesc="A Python Library that enables the user to find the country, region, city, coordinates, zip code, ISP, domain name, timezone, connection speed, IDD code, area code, weather station code, weather station name, mobile, usage types, address type and IAB category that any IP address or host name originates from."
arch=('any')
url="https://github.com/chrislim2888/IP2Location-Python"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chrislim2888/IP2Location-Python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0b35b2cc8992ea2ff9c85791652a2d8215380461940c7882e87cb9dce84fc434')

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
