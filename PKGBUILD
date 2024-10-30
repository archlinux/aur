# Maintainer: taotieren <admin@taotieren.com>

pkgname=certbot-dns-aliyun
_name=certbot-dns-aliyun
pkgver=2.0.0
pkgrel=0
epoch=
pkgdesc="Aliyun DNS Authenticator plugin for Certbot"
arch=('any')
url="https://pypi.org/project/certbot-dns-aliyun"
license=(Apache-2.0)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(
    certbot
    #     certbot-nginx
    python
    #     python-acme
    python-requests
)
makedepends=(python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('2acf1dd5595609adc1fa2eb2734a2823d75ba2a47453af13688d8dda37dd3c0b')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
