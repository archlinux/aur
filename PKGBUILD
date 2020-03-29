# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Duy Truong <jimreynold2nd@yahoo.com>

_name="jira"
_module="$_name"
_cmd="jirashell"

pkgname=("python-$_module")
pkgdesc="Python library for interacting with JIRA via REST APIs"
pkgver="2.0.0"
pkgrel=4
url="https://github.com/pycontribs/jira"
license=('BSD')
arch=('any')
depends=("python-pbr"
         "python-requests-oauthlib>=0.6.1"
         "python-requests>=2.10.0"
         "python-requests-toolbelt"
         "python-setuptools>=20.10.1"
         "python-six>=1.10.0"
         "python-defusedxml")
optdepends=("ipython")
makedepends=("python-pbr>=1.9")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e2a94adff98e45b29ded030adc76103eab34fa7d4d57303f211f572bedba0e93')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package_python-jira(){
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
