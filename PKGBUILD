# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=osaca
pkgname=python-$_name
pkgrel=1
pkgver=0.5.3
pkgdesc="Open Source Architecture Code Analyzer"
arch=('i686' 'x86_64')
url="https://github.com/RRZE-HPC/OSACA"
license=('AGPL-3.0')
depends=('python')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('b727ae17cb41db39ef2f79091dbc44f4a298757a7318a2bba62f66ab9d816a3f')

package() {
  cd ${srcdir}/$_name-$pkgver
  # install package
  python setup.py install --root="${pkgdir}"

  # license
  install -Dm644 ${srcdir}/$_name-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
