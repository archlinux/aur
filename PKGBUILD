# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgver=0.8.10
pkgrel=3
pkgdesc="A system to automate the compile/test cycle required by most software projects"
arch=('any')
url="http://buildbot.net"
license=("GPL")
depends=('python2-twisted' 'python2-jinja' 'python2-migrate'
	 'python2-dateutil' 'python2-sqlparse')
source=(https://pypi.python.org/packages/source/b/buildbot/buildbot-$pkgver.tar.gz
	version-parse.patch)
md5sums=('3201aaecf32df7810f4e23c14d20a544'
         '61986f8b1d88ab74c8b290c49580152b')

prepare() {
  cd "$srcdir"/buildbot-${pkgver/_/}
  patch -p1 <$srcdir/version-parse.patch
}

package() {
  cd "$srcdir"/buildbot-${pkgver/_/}
  python2 setup.py install --root="$pkgdir"
}
