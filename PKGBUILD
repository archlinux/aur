# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_name='click-didyoumean'
pkgname='python-click-didyoumean'
pkgver='0.0.3'
pkgrel=2
pkgdesc='Enable git-like did-you-mean feature in Click.'
arch=('any')
url='https://github.com/click-contrib/click-didyoumean'
license=('MIT')
depends=('python' 'python-click')
makedepends=('python-setuptools')
source=("https://github.com/click-contrib/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('6e832881817645eb8fa3a40acaab74a7f0dcc798aa984781a011b2ef78da2a4ae71ff2d58907bcbb35adbfc659727223c28c3622788eef05ecbdf758d6ac889d')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install -O1 --skip-build --prefix=/usr --root="${pkgdir}"
}
