# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: gue5t <gue5t@aur.archlinux.org>
_name=Mastodon.py
pkgname=python-mastodon
pkgver=1.3.1
pkgrel=1
pkgdesc="python bindings for the Mastodon RPC API"
arch=('any')
url="https://github.com/halcy/Mastodon.py"
license=('MIT')
depends=(python
         python-requests
         python-dateutil
         python-six
         python-pytz
         python-decorator
         python-http-ece
         python-cryptography)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3f000f34e2740a90fdadd923d1a7dd100dd62d56906c026ae725ce43301f30f6')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim: set sts=2 sw=2 ft=PKGBUILD:
