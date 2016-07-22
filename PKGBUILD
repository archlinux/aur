# Maintainer: Thomas Fanninger <thomas AT fanninger DOT at>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=('python-yowsup' 'python2-yowsup')
pkgver=2.5.0
pkgrel=4
pkgdesc="The open source cross platform Whatsapp library powering Wazapp"
url="https://github.com/tgalal/yowsup"
arch=('any')
license=('GPL')
makedepends=('python2-setuptools' 'python2-dateutil' 'python2-argparse' 'python2-axolotl' 'python2-pillow')
provide=('python-yowsup')
conflicts=('yowsup-client-git' 'python-yowsup-git')
source=("${pkgname}::https://github.com/tgalal/yowsup/archive/v${pkgver}.tar.gz")
sha512sums=('SKIP')

build(){
  cd $srcdir
}

package_python-yowsup() {
  cd "${srcdir}/yowsup-${pkgver}"
}

package_python2-yowsup() {
  pkgdesc='The open source cross platform Whatsapp library powering Wazapp - Python 2'
  depends=('python2' 'python2-dateutil' 'python2-argparse' 'python2-axolotl' 'python2-pillow' "python-yowsup=${pkgver}")

  cd "${srcdir}/yowsup-${pkgver}"
  python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1
}

check(){
  cd "${srcdir}/yowsup-${pkgver}"
  python2 setup.py test
}