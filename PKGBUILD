# Maintainer: brodokk <brodokk at brodokk dot space>

pkgname=silkaj

pkgver=0.10.0
pkgrel=1
pkgdesc="Powerfull, lightweight, and multi-platform command line client written with Python for Duniter’s currencies"

url='https://git.duniter.org/clients/python/silkaj'
arch=('any')
license=('GPL3')

depends=('python' 'python-click' 'python-ipaddress' 'python-texttable' 'python-tabulate' 'python-pynacl'
'python-duniterpy' 'python-pypeg2' 'python-pylibscrypt')
makedepends=(python-build python-installer python-wheel)

source=("https://git.duniter.org/clients/python/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('1e326f1d7b4b916e050615c29b27aaeb96d67199b188f5b164ef3059a6c61aa37afc60533e033ece769981850f6e086e3c09a313d83d565c9eb21054cccf3754')

build() {
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" dist/*.whl
}
