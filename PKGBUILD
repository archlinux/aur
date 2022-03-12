# Maintainer: Nissar Chababy <contact at funilrys dot com>

_appName="pyfunceble"
pkgname=${_appName}
_name=${pkgname}
upstreamName="PyFunceble"
pkgver=4.1.0
pkgrel=2
pkgdesc="The tool to check the availability or syntax of domain, IP or URL."
arch=('any')
url="https://pyfunceble.github.io"
license=('Apache 2.0')
conflicts=('pyfunceble-dev')
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
source=('https://files.pythonhosted.org/packages/e0/39/4044f16cb3b7fb1a569ff932efb4fc8f31f16628d05b8e5c83eae1b03359/PyFunceble-4.1.0.tar.gz' 'https://raw.githubusercontent.com/funilrys/PyFunceble/master/LICENSE')
sha256sums=('654ed251105f0599e3cab517a3b6005ce0f69241be0634b4bb28d04c63489edf'
            '4709994873033ba7bdbbc1bf12cfff093cc074e0dfb28c64b2a80a115916a41b')

build() {
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
