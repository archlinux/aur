# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail.com>

pkgname=howdoi
pkgver=2.0.19
pkgrel=1
pkgdesc="Instant coding answers via the command line"
arch=('any')
url="https://github.com/gleitz/howdoi"
license=('MIT')
depends=('keep' 'python-appdirs' 'python-cachelib' 'python-cssselect' 'python-lxml'
         'python-pygments' 'python-pyquery' 'python-requests' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4baa5270a98e9d001094d873a5a1b6a32eac021009cfc40cd9aeede633cb7556')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
