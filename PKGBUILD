# Maintainer: Javier Tia <javier dot tia at gmail dot com>
_name=humanize
pkgname='python-humanize'
pkgver=0.5.1
pkgrel=2
pkgdesc='Humanize is a modest package contains various common humanization utilities'
url='https://github.com/jmoiron/humanize'
arch=('any')
license=('MIT')
makedepends=('python')
source=("https://pypi.python.org/packages/source/h/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19')

# Enable for tests
check() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py check
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
