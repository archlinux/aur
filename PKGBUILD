# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=osaca
pkgname=python-$_name
pkgrel=1
pkgver=0.7.1
pkgdesc="Open Source Architecture Code Analyzer"
arch=('i686' 'x86_64')
url="https://github.com/RRZE-HPC/OSACA"
license=('AGPL-3.0')
depends=('python' 'python-ruamel-yaml' 'python-pyparsing' 'python-networkx')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('9cd75013d416757f1ecbc9d64f9b45a8fe07ed3c1a649c6ab5d365e845dab901')

package() {
  cd ${srcdir}/$_name-$pkgver
  # install package
  python setup.py install --root="${pkgdir}"

  # license
  install -Dm644 ${srcdir}/$_name-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
