# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-django-hyperkitty-git')
_pkgbase=hyperkitty
pkgver=1f6d7d8
pkgrel=1
pkgdesc="A Django app that provides a web user interface to access GNU Mailman archives"
arch=(any)
makedepends=('git' 'python2-setuptools')
provides=('python2-django-hyperkitty')
conflicts=('python2-django-hyperkitty')
depends=('python2-mailmanclient' 'python2-django-crispy-forms' 'python2-django-rest-framework'
         'python2-django-extensions' 'python2-social-auth' 'python2-django-gravatar'
         'python2-django-paintstore' 'python2-django-compressor' 'python2-django-browserid'
         'python2-django-haystack' 'python2-pytz' 'python2-dateutil'
         'python2-enum34' 'python2-networkx' 'sassc' 'python2-robot-detection')
url="https://gitlab.com/mailman/hyperkitty"
license=('GPL')
options=(!emptydirs)
source=("git+https://gitlab.com/mailman/hyperkitty.git")
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
