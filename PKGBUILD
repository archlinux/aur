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
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/dexy/dexy/develop/LICENSE")
sha256sums=('d1433a15267ae3ffa6ee8e1776298db9c3ae2e429845ee39d0e8bd2e98e0e2fe'
            '87159e27fa3f901ea96b5ca028c1695c531bdbadfd4cd8aee37661ca9d28bfb8')
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 ${srcdir}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
