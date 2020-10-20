# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail.com>

pkgname=howdoi
pkgver=2.0.7
pkgrel=1
pkgdesc="Instant coding answers via the command line"
arch=('any')
url="https://github.com/gleitz/howdoi"
license=('MIT')
depends=('keep' 'python-appdirs' 'python-cachelib' 'python-cssselect' 'python-lxml'
         'python-pygments' 'python-pyquery' 'python-requests' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('09362f7390119dffd83c61a942801ad4d19aee499340ef7e8d5871167391d3d6')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
