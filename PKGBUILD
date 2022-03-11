# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=python-undertime
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=1
pkgdesc="pick a meeting time"
url="https://gitlab.com/anarcat/undertime"
depends=('python-dateparser' 'python-pytz' 'python-pyaml' 'python-termcolor' 'python-tabulate')
makedepends=('python-pip')
license=('AGPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py3-none-any.whl")
sha256sums=('4e6edf8654d501c9dea8fd3842b3b2b3a58d3ac86cdf4473ddcb55ecc60fb0a9')

package() {
    cd "${srcdir}/"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
