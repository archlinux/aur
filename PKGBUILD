# Maintainer: bipin kumar <bipin@ccmb.res.in>

pkgname=python-pairwisedist
_module=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc='Calculate the pairwise-distance matrix for an array of n samples by p features'
arch=(any)
url="https://github.com/GuyTeichman/pairwisedist"
license=(Apache)
depends=(
         'python' 
         'python-numpy' 
         'python-scipy' 
         'python-pytest'
        )
makedepends=(
             'python-setuptools' 
             'python-installer' 
             'python-pytest-runner'
            )
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
md5sums=('9ff7554ab02ff78338ee5447b425caa2')

build() {
    cd "$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$_module-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "$srcdir/$_module-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
