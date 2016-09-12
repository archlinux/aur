# Maintainer: Cadel Watson <cadel@cadelwatson.com>

pkgname=panzer-git
pkgver=1.0.r14.g52bc933
pkgrel=1
pkgdesc="pandoc + styles"
arch=('any')
url="http://github.com/msprev/panzer"
license=('unknown')
depends=('pandoc' 'python' 'python-pandocfilters')

makedepends=('git')
provides=('panzer-git')
conflicts=('panzer-git')

source=('git://github.com/msprev/panzer.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/panzer
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}/panzer
  python setup.py install --root=${pkgdir} --optimize=1
}
