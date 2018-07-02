# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_name='click-completion'
pkgname='python-click-completion'
pkgver='0.3.1'
pkgrel=1
pkgdesc='Fish, Bash, Zsh, and PowerShell completion for Click.'
arch=('any')
url='https://github.com/click-contrib/click-completion'
license=('MIT')
depends=('python' 'python-click' 'python-jinja')
makedepends=('python-setuptools')
source=("https://github.com/click-contrib/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('b0cb90fd98cb6a374f619a1c7cc72c5655f2557a78980fd15b6813d888bb656b28a75384bb094cbc570c727c5477713b7cb689de5d523bb8c56ea79dd939f75a')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install -O1 --skip-build --prefix=/usr --root="${pkgdir}"
}
