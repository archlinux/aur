pkgname=crmngr
pkgver=2.0.3
pkgrel=3
pkgdesc="crmngr is a tool to aid with the management of a r10k-style control repository."
url="https://github.com/vshn/crmngr"
depends=('python' 'python-natsort' 'python-requests' 'git')
makedepends=('python-setuptools')
conflicts=('crmngr')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/crmngr/crmngr-$pkgver.tar.gz")
sha256sums=('69024a901a3faa48b8c1032b10d43a53816b10abfaee494377b545f7e4492323')

build() {
    cd "$srcdir/crmngr-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/crmngr-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
