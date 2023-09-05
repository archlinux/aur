pkgbase='python-lastversion'
pkgname=('python-lastversion')
_module='lastversion'
pkgver='3.0.1'
pkgrel=1
pkgdesc="A CLI tool to find the latest stable version of an arbitrary project"
url="https://github.com/dvershinin/lastversion"
depends=('python' 'python-dateutil' 'python-requests' 'python-packaging' 'python-cachecontrol' 'python-lockfile' 'python-appdirs' 'python-feedparser' 'python-pyyaml' 'python-tqdm' 'python-six' 'python-beautifulsoup4' 'python-distro')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('02fc2cde88aaf9773f777e55aa690335a7d5d409bd10b71b57ff3ee5a071e99d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
