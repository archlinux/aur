# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

_pkgname=qhue
pkgname='python-qhue'
pkgdesc='A very lightweight Python wrapper to the Philips Hue API'
pkgver=2.0.1
pkgrel=3
arch=('any')
url='https://github.com/quentinsf/qhue'
license=('GPL-2.0-only')
depends=('python' 'python-requests' 'python-requests-oauthlib')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=('python-yaml: debug print API responses')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quentinsf/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('bc35fd6388e1613e67af3c034bbfef6196fc0187d9c6d85aac924776c0e08dcd636f5bcc4ee46b3e429795e68843bd5145eb6e4978c3c84617ad851ce4a11a2d')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -I -m installer --destdir="${pkgdir}" dist/*.whl
}
