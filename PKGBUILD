# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-pyroma-hg
_pyname=pyroma
_hgname=pyroma
pkgver=149.0f8a385ac93e
pkgrel=1
pkgdesc="Test your project's packaging friendliness  (hg version)"
arch=('any')
url='https://bitbucket.org/regebro/pyroma'
license=('MIT')
depends=('python' 'python-docutils' 'python-setuptools')
makedepends=('mercurial')
options=(!emptydirs)
provides=('python-pyroma')
conflicts=('python-pyroma')
source=("hg+ssh://hg@bitbucket.org/regebro/${_hgname}")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_hgname}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_hgname}"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

# vim:set ts=2 sw=2 et:
