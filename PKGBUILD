# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=python-undertime
_name=${pkgname#python-}
pkgver=3.2.0
pkgrel=1
pkgdesc="pick a meeting time"
url="https://gitlab.com/anarcat/undertime"
depends=('python-dateparser' 'python-pytz' 'python-pyaml' 'python-termcolor' 'python-tabulate')
makedepends=('python-pip')
license=('AGPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py3-none-any.whl")
sha256sums=('406a4b41a9d40e34b0ed48b484fa5fd031b3f22c1b8dbe59097bfc9569d62fc0')

package() {
    cd "${srcdir}/"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
