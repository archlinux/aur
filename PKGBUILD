# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_name='click-completion'
pkgname='python-click-completion'
pkgver='0.2.1'
pkgrel=2
pkgdesc='Fish, Bash, Zsh, and PowerShell completion for Click.'
arch=('any')
url='https://github.com/click-contrib/click-completion'
license=('MIT')
depends=('python' 'python-click' 'python-jinja')
makedepends=('python-setuptools')
source=("https://github.com/click-contrib/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('a1de4da903ea6dac74404f54823f9b3cd0aefa66b596e85329239774ac6775ae8f09bbd80877e7b34747d804c7d9d1591338de30a1d570ef75e6beba3fa86fb8')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install -O1 --skip-build --prefix=/usr --root="${pkgdir}"
}
