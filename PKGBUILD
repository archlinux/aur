# Maintainer: Lorenz Steinert <lorenz AT steinerts DOT de>

pkgname=('python-django-hyperkitty')
_pkgbase=hyperkitty
_commit=154d90c73a1f84ecd217117f1a6959fffc072434
pkgver=1.3.0
pkgrel=1
pkgdesc="A Django app that provides a web user interface to access GNU Mailman archives"
arch=(any)
makedepends=('python-setuptools')
depends=('python-mailmanclient' 'python-django-crispy-forms' 'python-django-rest-framework'
         'python-social-auth' 'python-django-gravatar' 'python-django-paintstore'
         'python-django-compressor' 'python-django-browserid' 'python-django-haystack'
         'python-pytz' 'python-dateutil' 'python-enum34' 'python-networkx'
         'python-robot-detection' 'python-django-extensions' 'sassc')
url="https://gitlab.com/mailman/hyperkitty"
license=('GPL')
options=(!emptydirs)
install=
source=("${_pkgbase}-${pkgver}.tar.gz::https://gitlab.com/mailman/hyperkitty/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('0937047661e48080a06d53fbb35260bc69bc7f37c06eb408838e750744ca3235')

package() {
  cd "$srcdir/$_pkgbase-v$pkgver-$_commit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
