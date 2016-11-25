# Maintainer: Morten Linderud <morten@linderud.pw>  
# Contributor: Javier Tia <javier dot tia at gmail dot com>
_pkgname=humanize
pkgname="python2-${_pkgname}"
pkgver=0.5.1
pkgrel=1
pkgdesc='Humanize is a modest package contains various common humanization utilities'
url='https://github.com/jmoiron/humanize'
arch=('any')
license=('MIT')
makedepends=('python')
source=("https://pypi.python.org/packages/source/h/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19')

# Enable for tests
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
