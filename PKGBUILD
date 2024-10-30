# Maintainer: Antonin Godard <antonin dot godard at pm dot me>

_base='systemdunitparser'
pkgname="python-$_base"
pkgver=0.3
pkgrel=1
pkgdesc='Parser for systemd unit files'
url='https://github.com/sgallagher/systemdunitparser'
arch=('any')
license=('GPL-3.0-or-later')
makedepends=(
  'python-pytest'
  'python-setuptools'
)
provides=("${pkgname}=${pkgver}")
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('ecf69c53da1309c8dc11b7f235361c3421a7a2028ed0180c46f593e9880940e23485e9fab6b96df1542dedecc3ed3b986777e003e890d5aed65ae70eca9cf00c')

build() {
  cd "${srcdir}/${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_base}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
