# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
pkgname=kiwi
pkgver=1.11.1
pkgrel=1
pkgdesc="Framework for Python GUI applications."
arch=('any')
url="https://github.com/stoq/${pkgname}"
license=('LGPL')
depends=('python2' 'python2-setuptools'
 'gtk2' 'pygtk')
makedepends=('git')
optdepends=('python2-sqlobject' 'python2-zope-interface')
conflicts=('kiwi-git')
source=("https://github.com/stoq/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('3ecd5bdca3d636cfa7246de9adcbb8be')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
