# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: James Pearson <james.m.pearson+arch@gmail.com>
pkgname=python2-django-tagging
_pkgname=django-tagging
pkgver=0.4
pkgrel=1
pkgdesc="A generic tagging application for Django projects"
arch=('any')
url='https://pypi.python.org/pypi/django-tagging'
license=('MIT')
depends=('python2-django')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/d/django-tagging/django-tagging-${pkgver}.tar.gz")
sha256sums=('033e3d1b352f0dacdf8588dc83521ac602a020f34f4c1c389912eaff2915e557')

build() { 
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root=${pkgdir} --optimize=1
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
