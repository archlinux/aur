pkgname=python-pystitch
pkgver=1.0.1
pkgrel=1
pkgdesc="Pure Python library for the reading and writing of embroidery files"
arch=('any')
url="https://inkstitch.org/"
license=('MIT')
depends=('python' 'python-inkex')
provides=('pystitch')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/p/pystitch/pystitch-${pkgver}.tar.gz")
b2sums=('726e3fbcbd206de7449f2b179cfacd5020071cb51f78f0aec7889eded3f6b4ecc7193fc5725b86bfc3f286096c529f9bc0dab5af00cc72264b3daa01fe2caa58')

build() {
    cd "pystitch-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "pystitch-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-pystitch/LICENSE"
}