# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-husl
pkgname=('python-husl' 'python2-husl')
_pyname=husl
pkgver=4.0.3
pkgrel=2
pkgdesc='Human-friendly HSL'
arch=('any')
url='http://husl-colors.org/'
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.io/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('7228a056708ac92a8b1cc20a0ab18639'
         '7801e93600a1a8b0f0ad99cfb605a18f')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-husl() {
  depends=('python' 'python-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_python2-husl() {
  depends=('python2' 'python2-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
