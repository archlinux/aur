# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-configspace"
_name="ConfigSpace"
pkgver=0.7.1
pkgrel=1
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('edfb23f46fd08d2001308de64596da83ca5436248f32618d15b7f000c0a8512dcb8945346dc4ed57f284d8ab35490eb90bee1931b3b2b534bfa13dbdfe9abcd1')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
