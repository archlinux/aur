# Contributor: twa022 <twa022 at gmail dot com>

pkgname=python-system_hotkey
pkgver=1.0.2
pkgrel=1
pkgdesc="Python library for system wide hotkeys"
arch=('any')
url="https://github.com/timeyyy/system_hotkey"
license=('BSD')
depends=('python-xcffib')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/timeyyy/${pkgname/python-/}/archive/${pkgver}.tar.gz")
sha256sums=('4d6e06bf359efecf4bea251e330c852f83b9150f503df28fd94239499f4ff606')

package() {
  cd "${srcdir}/${pkgname/python-/}-${pkgver}"
  python setup.py install --root="${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${pkgname/python-/}-${pkgver}/LICENSE"
}
