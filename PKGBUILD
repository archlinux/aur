# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/jath03/openrgb-python

pkgname=python-openrgb-git
pkgver=v0.0.5.r1.gf32661a
pkgrel=1
pkgdesc="A python client for the OpenRGB SDK"
arch=('any')
url="https://github.com/jath03/openrgb-python"
license=('GPL-3.0')
makedepends=('python-setuptools' 'git')
depends=('openrgb' 'python')
conflicts=('python-openrgb')
provides=('python-openrgb')
source=("python-openrgb::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/python-openrgb"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/python-openrgb"
  python setup.py install --root="${pkgdir}"
}
