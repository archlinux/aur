# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=obnam
pkgver=1.9
pkgrel=1
pkgdesc="Easy, secure backup program"
arch=('i686' 'x86_64')
url="http://obnam.org/"
license=('GPL3')
depends=('python2-paramiko' 'python2-tracing' 'python2-larch'
         'python2-ttystatus' 'python2-cliapp' 'python2-yaml')
optdepends=('python2-fuse: support for mounting backups')
source=("http://code.liw.fi/debian/pool/main/o/obnam/obnam_$pkgver.orig.tar.gz")
sha256sums=('e5dc38fd0b923438153f4f983e517b80269129fdb011c8d7900c76076b1f916a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's/python/python2/' setup.py
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
