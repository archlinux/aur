# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Hugo Doria <hugodoria@gmail.com>
# Contributor: priyank <priyankmg@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=obmenu
pkgver=1.0
pkgrel=12
pkgdesc='Openbox menu editor.'
arch=('any')
url='http://obmenu.sourceforge.net/'
license=('GPL')
depends=('python2' 'pygtk' 'openbox')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('710036a5edc9886d6d563ce46c747432')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i -e 's#usr/bin/python#usr/bin/python2#g' *.py
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

