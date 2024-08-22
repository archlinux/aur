# Maintainer: IP2Location <support@ip2location.io>
pkgname=ip2location-python-csv-converter
pkgver=1.2.3  # Replace with the actual latest version
pkgrel=1
pkgdesc="Python script converts IP2Location CSV database into IP range or CIDR format."
arch=('any')
url="https://github.com/ip2location/ip2location-io-python"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ip2location/ip2location-python-csv-converter/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('80e353bc62da9882c70e9250220b307d0ce89cb51c4c2dec7e80482008ae9578')

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
