# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=glueviz
pkgver=0.13.3
pkgrel=2
pkgdesc="Linked Data Visualizations Across Multiple Files"
arch=('i386' 'x86_64')
url="http://glueviz.org/"
license=('CUSTOM')
depends=('python' 'python-glue-core' 'python-glue-vispy-viewers')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/f9/57/917928d18cd6d55c8cdb1098aba5d1cb2bc25a4505933f5f83bd51adf423/${pkgname}-${pkgver}.tar.gz)
sha256sums=('80e617608e5937409a87ffe95285f338eee8824dbff1b3692c9733f7d76d752b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

