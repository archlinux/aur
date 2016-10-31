# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgver=0.8.12
pkgrel=1
pkgdesc="A system to automate the compile/test cycle required by most software projects"
arch=('any')
url="http://buildbot.net"
license=("GPL")
depends=('python2-twisted' 'python2-jinja' 'python2-migrate'
	 'python2-dateutil' 'python2-sqlparse')
source=(https://pypi.python.org/packages/source/b/buildbot/buildbot-$pkgver.tar.gz
	version-parse.patch)
md5sums=('c61fa219942f8a1ed43cdbc1e4ef0187'
         '61986f8b1d88ab74c8b290c49580152b')

prepare() {
  cd "$srcdir"/buildbot-${pkgver/_/}
  patch -p1 <"$srcdir"/version-parse.patch
}

package() {
  cd "$srcdir"/buildbot-${pkgver/_/}
  python2 setup.py install --root="$pkgdir"
}
