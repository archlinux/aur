# Maintainer: Thomas Fanninger <thomas AT fanninger DOT at>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgbase=python-yowsup
pkgname=('python-yowsup' 'python2-yowsup')
pkgver=2.5.0
pkgrel=2
pkgdesc="The open source cross platform Whatsapp library powering Wazapp"
url="https://github.com/tgalal/yowsup"
arch=('any')
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools' 'python-dateutil' 'python2-dateutil' 'python-argparse' 'python2-argparse' 'python-axolotl' 'python2-axolotl' 'python-pillow' 'python2-pillow')
provide=('python-yowsup')
conflicts=('yowsup-client-git' 'python-yowsup-git')
source=("${pkgname}::https://github.com/tgalal/yowsup/archive/v${pkgver}.tar.gz")
sha512sums=('SKIP')

build(){
  cd $srcdir
  cp -r yowsup-${pkgver} python2-yowsup-${pkgver}
}

package_python-yowsup() {
  depends=('python' 'python-dateutil' 'python-argparse' 'python-axolotl' 'python-pillow')

  cd "${srcdir}/yowsup-${pkgver}"
  python3 setup.py install --root=$pkgdir --optimize=1
}

package_python2-yowsup() {
  depends=('python2' 'python2-dateutil' 'python2-argparse' 'python2-axolotl' 'python2-pillow')

  cd "${srcdir}/python2-yowsup-${pkgver}"
  python2 setup.py install --root=$pkgdir --optimize=1
}

check(){
  cd ${srcdir}/yowsup-${pkgver}
  #python3 setup.py test

  cd ${srcdir}/python2-yowsup-${pkgver}
  python2 setup.py test
}