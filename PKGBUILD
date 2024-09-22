# Maintainer: Nissar Chababy <contact at funilrys dot com>

_appName="pyfunceble"
pkgname=${_appName}
_name=${pkgname}
upstreamName="PyFunceble"
pkgver=4.2.27
pkgrel=1
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
source=('https://files.pythonhosted.org/packages/b0/8d/bf8acf4abf8941769f6b72350f2c76f8a03e4759041848689889dcbb6389/pyfunceble-4.2.27.tar.gz' 'https://raw.githubusercontent.com/funilrys/PyFunceble/master/LICENSE')
sha256sums=('a87106b66e037f79db172ddd8f9b4daa551a518e5993571d014903cf0adf1f0a'
            '2411ba51f3e77f7f78d00b70641eafc002ba607f36128ea7ccc5678c6aa8a45d')

build() {
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
