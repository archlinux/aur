# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=rainbow
pkgver=2.6.0
pkgrel=1
pkgdesc="Colorize commands output or STDIN using patterns."
arch=(any)
url="https://github.com/nicoulaj/rainbow"
license=(GPL3)
depends=(python)
makedepends=('python-setuptools'
             'python-fastentrypoints'
             'python-jinja')
changelog=Changelog
provides=('rainbow-git')
conflicts=('rainbow-git')
source=("https://pypi.python.org/packages/dd/b7/e8837bab5047dbc82250266afd247aae0e7a9a0cf969257c31c5de4be815/${pkgname}-${pkgver}.tar.gz")
md5sums=('57d079fba8a7cd6cbb4afed56e926a04')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
