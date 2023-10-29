pkgbase='python-icmplib'
pkgname=('python-icmplib')
_module='icmplib'
pkgver='3.0.4'
pkgrel=1
pkgdesc="Easily forge ICMP packets and make your own ping and traceroute."
url="https://github.com/ValentinBELYN/icmplib"
depends=('python')
makedepends=('python-build' 'python-installer')
license=('LGPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('57868f2cdb011418c0e1d5586b16d1fabd206569fe9652654c27b6b2d6a316de')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
