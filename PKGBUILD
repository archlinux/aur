# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=python38-zope-event
pkgver=4.5.0
pkgrel=6
pkgdesc="Provides a simple event system"
arch=(any)
license=('ZPL')
url="https://github.com/zopefoundation/zope.event"
depends=('python38')
makedepends=('python38-setuptools')
source=("https://github.com/zopefoundation/zope.event/archive/${pkgver}.tar.gz")
sha512sums=('2414a283988dc646e48153e389688b8eec4db528f7ac9ff45f982ce42295d390985825ac0f9db566fc5600fe4c96a8297a9c5718a16abc6d1831c72ee42c163d')
makedepends=('python38-setuptools')

build() {
  cd "${srcdir}/zope.event-${pkgver}"
  python3.8 setup.py build
}

check() {
  cd "${srcdir}/zope.event-${pkgver}"
  python3.8 setup.py test
}

package() {
  cd "$srcdir/zope.event-$pkgver"
  python3.8 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
