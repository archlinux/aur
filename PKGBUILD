# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-talos"
_pkgname="talos"
pkgver=0.4.9
pkgrel=1
pkgdesc="Talos radically changes the ordinary Keras workflow by fullyautomating hyperparameter tuning and model evaluation. Talos exposes Keras functionality entirely and there is no new syntax or templates to learn."
arch=('any')
url="https://github.com/autonomio/talos/"
license=('MIT')
depends=('python' 'python-keras' 'python-numpy' 'python-pandas' 'python-scikit-learn' 'python-tqdm' 'python-requests' 'python-wrangle' 'python-chances' 'python-astetik' 'python-kerasplotlib')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/74/26/c44a51af579835c873e878b99c68fcba08107cdfc22d72ac4ecbc027f158/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('623f0bfe33f1429453913cf64eabbf5cd34d3147781013f8824fb3888d6ad8fd')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
