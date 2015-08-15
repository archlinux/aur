# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=obnam
pkgver=1.14
pkgrel=1
pkgdesc="Easy, secure backup program"
arch=('i686' 'x86_64')
url="http://obnam.org/"
license=('GPL3')
depends=('python2-paramiko' 'python2-tracing' 'python2-larch'
         'python2-ttystatus' 'python2-cliapp' 'python2-yaml')
optdepends=('python2-fuse: support for mounting backups')
source=("http://code.liw.fi/debian/pool/main/o/obnam/obnam_$pkgver.orig.tar.xz")
sha256sums=('78203274010ab378ace8c8fd57782ab8bfa1b0482b95604873bd9e45c22b0799')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's/python/python2/' setup.py
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
