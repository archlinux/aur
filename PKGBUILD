# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=django-voting
pkgver=1.0
pkgrel=1
pkgdesc='A generic voting application for Django projects'
arch=('any')
url="https://github.com/jezdez/django-voting/"
license=('BSD')
depends=('python-django')
source=("https://pypi.python.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('8c3b662c85bdb1a961bcc0cec567b50a')

PYTHON='python'

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  $PYTHON setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m 644 "LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
