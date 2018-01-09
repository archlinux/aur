pkgname=crmngr
pkgver=2.0.2
pkgrel=1
pkgdesc="crmngr is a tool to aid with the management of a r10k-style control repository."
url="https://github.com/vshn/crmngr"
depends=('python' 'python-natsort' 'python-requests' 'git')
makedepends=('python-setuptools')
conflicts=('crmngr')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/crmngr/crmngr-$pkgver.tar.gz")
md5sums=('de19f9badb959729697805eb6c7ab761')

build() {
    cd "$srcdir/crmngr-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/crmngr-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
