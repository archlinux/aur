# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=namebench
pkgver=1.3.1
pkgrel=7
pkgdesc="Open-source DNS benchmark utility"
arch=(any)
url="http://code.google.com/p/namebench/"
license=(Apache)
depends=(python2-dnspython python2-httplib2 python2-simplejson python2-jinja
         python2-graphy)
optdepends=('tk: gui')
source=(https://$pkgname.googlecode.com/files/$pkgname-$pkgver-source.tgz)
md5sums=('34e74eac37d6747592f8d5085f03ee4f')

package() {
  cd namebench-$pkgver
  export NO_THIRD_PARTY=true
  python2 setup.py install --root="$pkgdir"
  cd "$pkgdir/usr"
  mkdir share
  mv namebench share
}
