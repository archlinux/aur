pkgbase='python-lastversion'
pkgname=('python-lastversion')
_module='lastversion'
pkgver='3.6.10'
pkgrel=1
pkgdesc="A CLI tool to find the latest stable version of an arbitrary project"
url="https://github.com/dvershinin/lastversion"
depends=('python' 'python-dateutil' 'python-requests' 'python-packaging' 'python-cachecontrol' 'python-appdirs' 'python-feedparser' 'python-pyyaml' 'python-tqdm' 'python-beautifulsoup4' 'python-distro')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('521de26b474d3da2a75414a2227c71fa691f893b5aff7f7e3f24ab057734eb9b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
