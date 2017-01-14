# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: pumpkin <pumpkin at mailoo dot org>
# Contributor: Vsevolod Balashov <vsevolod at balashov dot name>

pkgname=python2-gunicorn
_pkgname=gunicorn
pkgver=19.6.0
pkgrel=1
pkgdesc='WSGI HTTP Server for UNIX'
arch=('x86_64' 'i686' 'armv7h' 'armv6h')
url='http://gunicorn.org/'
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
provides=('gunicorn-python2')
conflicts=('gunicorn-python2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/benoitc/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1e0de4957bea60bfcff5215664bdfc3cf02c78e2aae9586766a9b4b437aebbb0')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  mv "${pkgdir}/usr/bin/gunicorn" "${pkgdir}/usr/bin/gunicorn-python2"
  rm -r "${pkgdir}/usr/bin/gunicorn_django" "${pkgdir}/usr/bin/gunicorn_paster"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
