# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-pyyaml-env-tag"
_name="${pkgname#python-}"
_pyname="${_name//-/_}"
pkgver=0.1
pkgrel=1
pkgdesc=" A custom YAML tag for referencing environment variables in YAML files"
url="https://github.com/waylan/pyyaml-env-tag"
license=("MIT")
arch=("any")
depends=("python-yaml")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=("70092675bda14fdec33b31ba77e7543de9ddc88f2e5b99160396572d11525bdb")

build(){
 cd "pyyaml_env_tag-$pkgver"
 python setup.py build
}

package(){
 cd "pyyaml_env_tag-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
