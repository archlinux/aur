pkgbase='python-lastversion'
pkgname=('python-lastversion')
_module='lastversion'
pkgver='2.4.8'
pkgrel=3
pkgdesc="A CLI tool to find the latest stable version of an arbitrary project"
url="https://github.com/dvershinin/lastversion"
depends=('python' 'python-dateutil' 'python-requests' 'python-packaging' 'python-cachecontrol' 'python-lockfile' 'python-appdirs' 'python-feedparser' 'python-pyyaml' 'python-tqdm' 'python-six' 'python-beautifulsoup4' 'python-distro')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('dbb6f675bd4c124c888deff66b378cc0bf247638a951cf223f323ba148334fb8')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
