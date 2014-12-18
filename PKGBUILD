# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=python2-webassets-0.10
_pkgname=webassets
pkgver=0.10
pkgrel=1
pkgdesc="Media asset management for Python, with glue code for various web frameworks"
arch=('any')
url="http://github.com/miracle2k/webassets/"
license=('BSD')
depends=('python2' 'django-1.4')
optdepends=('python2-pillow: support for image manipulation'
            'python2-nose: required to run tests'
            'python2-mock: required to run tests')
provides=('python2-webassets')
conflicts=('python2-webassets')
source=(http://pypi.python.org/packages/source/w/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('27bdefac7e640ab5752ba0c34212b9dc')

package() {
  cd "${srcdir}/$_pkgname-$pkgver"

  python2 setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

