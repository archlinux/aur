# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=python-undertime
_name=${pkgname#python-}
pkgver=2.6.0
pkgrel=1
pkgdesc="pick a meeting time"
url="https://gitlab.com/anarcat/undertime"
depends=('python-dateparser' 'python-pytz' 'python-pyaml' 'python-termcolor' 'python-tabulate')
makedepends=('python-pip')
license=('AGPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py3-none-any.whl")
sha256sums=('c15e06989509dbca1f590e281408c9237d2b8bb19cf11f52c88b578ba494feea')

package() {
    cd "${srcdir}/"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
