# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-django-postorius-git')
_pkgbase=postorius
pkgver=c41dc4a
pkgrel=1
pkgdesc="A Django app that provides a web user interface to access GNU Mailman"
arch=(any)
provides=('python2-django-postorius')
conflicts=('python2-django-postorius')
makedepends=('git' 'python2-setuptools')
depends=('python2' 'python2-django-browserid' 'python2-mailmanclient' 'python2-httplib2')
url="https://gitlab.com/mailman/postorius"
license=('LGPL')
options=(!emptydirs)
source=("git+https://gitlab.com/mailman/postorius.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
}

package() {
  cd "$srcdir/$_pkgbase"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
