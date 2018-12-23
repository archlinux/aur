# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>

_name='casttube'
pkgname="python-$_name"
pkgver='0.2.0'
pkgrel=1
pkgdesc="YouTube chromecast api"
url="http://github.com/ur1katz/casttube"
depends=('python' 'python-requests' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/${_name}/${_name}-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('f25b3c634efe702896233690f7590e8d6311590910f18dbb763b90419d9ef53c'
            '7178b432584adb0a05ef3b47c2f458a8c4ff378fd364b9e2498971d77c7ffa3e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
