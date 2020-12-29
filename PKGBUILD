#Maintainer: digital mystik <dgtl_mystik at protonmail dot ch>

_name=trezor-agent
pkgname=python-trezor-agent
pkgver=0.14.2
pkgrel=1
pkgdesc="Using hardware wallets as SSH/GPG agent"
arch=('any')
url="https://github.com/romanz/trezor-agent"
license=("LGPL3")
depends=('python' 'python-docutils' 'python-wheel' 'python-shutilwhich' 
         'python-configargparse' 'python-daemon' 'python-ecdsa' 'python-pynacl' 
         'python-mnemonic' 'python-pymsgbox' 'python-semver' 'python-unidecode')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/romanz/$_name/archive/v$pkgver.tar.gz")

b2sums=('7f1623e0b7c2e096c04ee0d6cb3dfe24191f8f935fbec64862427ac4a6430ed362e2b416b6906e367d328b6197be16a1ded856bac28a88999a102b585448f07c')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
