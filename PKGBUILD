# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-configspace"
_name="ConfigSpace"
pkgver=0.7.1
_sdist=configspace
pkgrel=2
pkgdesc="Creation and manipulation of parameter configuration spaces for automated algorithm configuration and hyperparameter tuning"
url="https://github.com/automl/ConfigSpace"
license=("BSD-3")
arch=("any")
depends=("cython"
         "python"
         "python-numpy"
         "python-pyparsing"
         "python-scipy"
         "python-typing_extensions"
         "python-more-itertools"
         "python-oldest-supported-numpy")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_sdist::1}/${_sdist}/${_sdist}-${pkgver}.tar.gz")
b2sums=('5c7aecc6e2b72ecc948b270edc266de7ab79022f98ffe200089fb8e83ff4f83d3a99a45ca7aab367914f0d08ae81e5a21398250365e550b5c66eeb816bbd63f9')
options=("!strip")

build(){
 cd "${_sdist}-${pkgver}"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_sdist}-${pkgver}"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
