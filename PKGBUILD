# Maintainer: Meir Kriheli <mkriheli@gmail.com>
# Contributor:

pkgname=python-cookiecutter
_pkgname=cookiecutter
pkgver=1.0.0
pkgrel=2
pkgdesc="A command-line utility that creates projects from project templates"
arch=('any')
url="https://github.com/audreyr/cookiecutter"
license=('BSD')
groups=('devel')
depends=('python' 'python-jinja' 'python-yaml' 'python-binaryornot')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/audreyr/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('3a0ea853b74bc9b6aad9fce202743728')

prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  sed -i -e 's/click<4\.0/click/' setup.py
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
