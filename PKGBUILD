# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=rainbow
pkgver=2.6.2
pkgrel=1
pkgdesc="Colorize commands output or STDIN using patterns."
arch=(any)
url="https://github.com/nicoulaj/rainbow"
license=(GPL3)
depends=(python)
makedepends=('python-setuptools'
             'python-jinja')
changelog=Changelog
provides=('rainbow-git')
conflicts=('rainbow-git')
source=("https://files.pythonhosted.org/packages/source/r/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('16dd2ae76093ff62273a22f6495dc4fd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
