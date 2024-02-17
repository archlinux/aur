# Maintainer: Antonin Godard <antonin dot godard at pm dot me>

_base='systemdunitparser'
pkgname="python-$_base"
pkgver=0.2
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
sha512sums=('d2cfce480fcb67dd6026f9c7b3ba4733d541c04fee4e9afdfb7cca48573a467039ef9d23f29be283de762e1b39366979e0b14a9626079f88a929f417f6cceb23')

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
