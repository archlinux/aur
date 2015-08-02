# Maintainer: Sebastien Leduc <sebastien AT sleduc DOT fr>
# Contributor: sl13lp <slackpinguino@gmail.com>

pkgname=('python-nmap' 'python2-nmap')
pkgbase='python-nmap'
_realname=python-nmap
pkgver=0.4.0
pkgrel=1
depends=('nmap')
pkgdesc="A Python library which helps in using the nmap port scanner. required nmap software"
arch=("any")
url="http://xael.org/norman/python/python-nmap"
license=('GPL3')
source="http://xael.org/norman/python/python-nmap/$pkgname-$pkgver.tar.gz"
md5sums=('2046fa63e969ae77b68e91664e97876b')

prepare() {
  cp -a "${srcdir}/${_realname}-${pkgver}"{,-python2}
}

package_python-nmap() {
  depends+=("python")
  makedepends=("python-setuptools")
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

package_python2-nmap() {
  depends+=("python2")
  makedepends=("python2-setuptools")
  cd "$srcdir/$_realname-$pkgver-python2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
}
# vim:set ts=2 sw=2 et:
