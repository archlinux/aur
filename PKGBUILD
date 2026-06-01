_name=timetree_exporter
pkgname=timetree-exporter
pkgver=0.7.2
pkgrel=1
pkgdesc="A Tool for Exporting TimeTree Calendar and Converting to iCal Format (.ics) (RFC 5545 Compatible)"
arch=('any')
url="https://github.com/eoleedi/TimeTree-Exporter"
license=('MIT')
depends=('python>=3.10' 'python-icalendar>=6.1.0' 'python-tzdata>=2024.2' 'python-requests>=2.32.5')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling') 
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$_name-$pkgver.tar.gz")
sha256sums=('a9a2e4b678de33499aa4cf1205939e6cb97411f95b37f7dca8def2f1e87a09f9')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
