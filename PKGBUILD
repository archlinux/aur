# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: gue5t <gue5t@aur.archlinux.org>
_name=Mastodon.py
pkgname=python-mastodon
pkgver=1.4.6
pkgrel=1
pkgdesc="python bindings for the Mastodon RPC API"
arch=('any')
url="https://github.com/halcy/Mastodon.py"
license=('MIT')
depends=(python
	 python-magic-ahupp
         python-requests
         python-dateutil
         python-six
         python-pytz
         python-decorator
         python-http-ece
         python-cryptography)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2b01559487165406d72fded986fd86e16997de2a9d2f3dec68a9c1bcb1dd71c3')

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
