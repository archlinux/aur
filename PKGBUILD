# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=osaca
pkgname=python-$_name
pkgrel=1
pkgver=0.6.0
pkgdesc="Open Source Architecture Code Analyzer"
arch=('i686' 'x86_64')
url="https://github.com/RRZE-HPC/OSACA"
license=('AGPL-3.0')
depends=('python' 'python-ruamel-yaml' 'python-pyparsing' 'python-networkx')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('7f1a8ab196412039642a60e8964550ad744a478e9d1df19af1bbc2c0823a43ff')

package() {
  cd ${srcdir}/$_name-$pkgver
  # install package
  python setup.py install --root="${pkgdir}"

  # license
  install -Dm644 ${srcdir}/$_name-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
