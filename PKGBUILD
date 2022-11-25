# Maintainer: Nissar Chababy <contact at funilrys dot com>

_appName="pyfunceble"
pkgname=${_appName}-dev
_name=${pkgname}
upstreamName="PyFunceble-dev"
pkgver=4.1.3
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
source=('https://files.pythonhosted.org/packages/fa/b5/d8e2b147d5760dc8d50e733542d37c0216e303ffaae030cbcef7ee7ef7d9/PyFunceble-dev-4.1.3.tar.gz' 'https://raw.githubusercontent.com/funilrys/PyFunceble/dev/LICENSE')
sha256sums=('667e556e0a9b6d0f46b0bf4ea6528b1fef349669fa17ff5d0916c8b784b87bee'
            '4709994873033ba7bdbbc1bf12cfff093cc074e0dfb28c64b2a80a115916a41b')

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
