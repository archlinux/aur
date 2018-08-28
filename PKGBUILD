# Maintainer: Ding Xiao <tinocodfcdsa10@mails.tsinghua.edu.cn>

pkgname="python2-pebble"
pkgver=4.3.9.r1.g29dbe0e
pkgrel=1
pkgdesc='Pebble provides a neat API to manage threads and processes within an application.'
arch=('any')
url='https://pypi.org/project/pebble'
license=('MIT')
makedepends=('python2-setuptools'
             'git')
depends=('python2>=2.7')
provides=('python2-pebble')
source=("${pkgname}::git+https://github.com/noxdafox/pebble.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${pkgname}
}

build() {
  cd ${srcdir}/${pkgname}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}
  python2 setup.py install --root=${pkgdir}/ --optimize=1
  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}