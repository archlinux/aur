# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_name='click-completion'
pkgname='python-click-completion'
pkgver='0.4.1'
pkgrel=1
pkgdesc='Fish, Bash, Zsh, and PowerShell completion for Click.'
arch=('any')
url='https://github.com/click-contrib/click-completion'
license=('MIT')
depends=('python' 'python-click' 'python-jinja')
makedepends=('python-setuptools')
source=("https://github.com/click-contrib/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('e4b9faf0706b49294b3cc36636f9b329acbe5fbc030d53c7057a263cd26a34438516885ddf31acfc6fc1db59fb082418778df66b926e113cc16954ec5c38edf0')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install -O1 --skip-build --prefix=/usr --root="${pkgdir}"
}
