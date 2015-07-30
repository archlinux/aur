# Maintainer: Sebastian Lau <archlinux _at_ slau _dot_ info>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: pumpkin <pumpkin at mailoo dot org>
# Contributor: Vsevolod Balashov <vsevolod at balashov dot name>

pkgname=python2-gunicorn
_pkgname=gunicorn
pkgver=19.3
pkgrel=2
pkgdesc='WSGI HTTP Server for UNIX'
arch=(any)
url='http://gunicorn.org/'
license=(MIT)
depends=(python2)
makedepends=(python2-distribute)
provides=(gunicorn-python2)
conflicts=(gunicorn-python2)
source=("https://github.com/benoitc/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('06279932c743286f6420e32638c8c581db688d31aa75fcb719ed63bc2a36d7f0')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  mv "${pkgdir}/usr/bin/gunicorn" "${pkgdir}/usr/bin/gunicorn-python2"
  rm -r "${pkgdir}/usr/bin/gunicorn_django" "${pkgdir}/usr/bin/gunicorn_paster"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
