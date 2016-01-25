# Maintainer: Dean Galvin <deangalvin3@gmail.com>

_pkgname="homeassistant"
pkgname="python-home-assistant"
pkgdesc='Home Assistant is an open-source home automation platform running on Python 3'
pkgver=0.11.1
pkgrel=1
url="https://home-assistant.io/"
license=('MIT')
arch=('any')
makedepends=('python-setuptools')
depends=('python>=3.4' 'python-pip' 'python-requests' 'python-yaml' 'python-pytz' 'python-vincenty' 'python-jinja>=2')
optdepends=('git: install component requirements from github')
conflicts=('python-home-assistant' 'python-home-assistant-git')
source=("http://pypi.python.org/packages/source/h/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5d007e686061fd58273aa2db5ad88a5e0649557a29e10c8b4f599ad7aee46ee1')

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python3 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
