# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>
pkgname=dexy
pkgver=1.0.15
pkgrel=1
pkgdesc="Open source automation software with features especially designed for documentation and reporting."
arch=('any')
url='http://www.dexy.it/'
license=('MIT')
depends=('python2'
         'python2-beautifulsoup4'
         'python2-chardet'
         'python2-docutils'
         'python2-jinja'
         'python2-markdown'
         'python2-pexpect'
         'python2-ply'
         'python2-pygments'
         'python2-requests>=0.10.6'
         'python2-yaml'
         'python2-cashew>=0.2.7'
         'python2-dexy-viewer'
         'python2-inflection>=0.2.0'
         'python2-modargs>=1.7')
makedepends=('python2-setuptools')
options=(!emptydirs)
provides=("${pkgname}")
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/dexy/dexy/develop/LICENSE")
md5sums=('99eb783fdf829b74f4d1f3a801693b86'
         '7ae0144577340e245b148893690d7f37')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
