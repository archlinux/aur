# Maintainer: Nissar Chababy <contact at funilrys dot com>

_appName="pyfunceble"
pkgname=${_appName}-dev
_name=${pkgname}
upstreamName="PyFunceble-dev"
pkgver=4.2.0a12
pkgrel=1
pkgdesc="The tool to check the availability or syntax of domain, IP or URL."
arch=('any')
url="https://pyfunceble.github.io"
license=('Apache 2.0')
provides=("${_appName}")
conflicts=('pyfunceble')
provides=("pyfunceble=${pkgver}")
depends=(
    'domain2idna'
    'python-alembic'
    'python-box'
    'python-colorama'
    'python-cryptography'
    'python-distribute'
    'python-dnspython'
    'python-dotenv'
    'python-inflection'
    'python-msgpack'
    'python-pyaml'
    'python-pymysql'
    'python-pysocks'
    'python-requests'
    'python-ruamel-yaml'
    'python-setuptools'
    'python-shtab'
    'python-sqlalchemy'
    'python-toml'
    'python3'
)
source=('https://files.pythonhosted.org/packages/46/fa/8b9242ce96e0c86e98d65754fe883a18854ca892ebbeea4be939cc1e954a/PyFunceble-dev-4.2.0a12.tar.gz' 'https://raw.githubusercontent.com/funilrys/PyFunceble/dev/LICENSE')
sha256sums=('00ce1ba4c13940b244b23b366245bfbacb1dd58a64b917d873d9a715801fe0bc'
            '0fccbd3165a49d240880baac5fdc2fa448189034a217f2f17ce5ce4f64562224')

build() {
    echo "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${upstreamName}-${pkgver}.tar.gz"
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
