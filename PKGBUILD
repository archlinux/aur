pkgname=crmngr
pkgver=2.0.1
pkgrel=1
pkgdesc="crmngr is a tool to aid with the management of a r10k-style control repository."
url="https://github.com/vshn/crmngr"
depends=('python' 'python-natsort' 'python-requests' 'git')
makedepends=('python-setuptools')
conflicts=('crmngr')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/crmngr/crmngr-$pkgver.tar.gz")
md5sums=('fe94b202cea2bed8a1671050b55bf4ea')

build() {
    cd "$srcdir/crmngr-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/crmngr-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
