# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-talos"
_pkgname="talos"
pkgver=0.6.3
pkgrel=1
pkgdesc="Talos radically changes the ordinary Keras workflow by fullyautomating hyperparameter tuning and model evaluation. Talos exposes Keras functionality entirely and there is no new syntax or templates to learn."
arch=('any')
url="https://github.com/autonomio/talos/"
license=('MIT')
depends=('python' 'python-keras' 'python-numpy' 'python-pandas' 'python-scikit-learn' 'python-tqdm' 'python-requests' 'python-wrangle' 'python-chances' 'python-astetik' 'python-kerasplotlib')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/1d/df/c352679af3259829dafa7d55f2d3e9fca201c848351cb3c841a062df001c/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('24deb5d8d9c6f10374b49ce113474f25ca6741dd4797b092aa53a2b7f0dc4093')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
