# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ibis
_pkgname=ibis-framework
pkgver=3.0.2
pkgrel=1
pkgdesc="A pandas-like deferred expression system, with first class SQL support"
arch=('any')
url="https://github.com/ibis-project/ibis"
license=('Apache')
depends=('python-multipledispatch' 'python-numpy' 'python-pandas' 'python-pydantic' 'python-regex' 'python-toolz')
checkdepends=('python-pytest')
optdepends=()
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('5051b56d125ef0f64375f5dc98873d3238736dd09a4b7aa615c0b40368f362d4')

build(){
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

#check(){
  #local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  #cd "$_pkgname-$pkgver"
  #python setup.py install --root=test_dir
  #export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  #rm ibis/tests/test_version.py
  #mv test_dir/$_site_packages/ibis{_framework,}-${pkgver}-py3.10.egg-info/
  #pytest
#}
# vim:ts=2:sw=2:et:
