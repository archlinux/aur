# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-yapsy-hg
pkgver=333.25f431f9e003
pkgrel=1
pkgdesc='Yet another plugin system  (hg version)'
arch=('any')
url='http://yapsy.sourceforge.net/'
license=('BSD')
depends=('python')
makedepends=('mercurial')
options=(!emptydirs)
provides=('python-yapsy')
conflicts=('python-yapsy')
source=("hg+http://hg.code.sf.net/p/yapsy/code")
md5sums=('SKIP')

package() {
  cd "${srcdir}/code/package"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/code/package"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

# vim:set ts=2 sw=2 et:
