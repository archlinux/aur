# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python2-pyblock
pkgver=0.52
_tag=pyblock-$pkgver-1
pkgrel=1
pkgdesc='Python modules for dealing with block devices'
arch=(i686 x86_64)
license=(GPL)
url='https://git.fedorahosted.org/git/pyblock.git'
depends=(python2 libselinux dmraid)
source=(https://git.fedorahosted.org/cgit/pyblock.git/snapshot/pyblock-$_tag.tar.xz
        use_python2.patch)
sha1sums=('eaa65273241a4f861fd0b06b3541203dbe4359e2'
          '96f9919d883390a229bacc68c27bc8eac27d4798')

prepare() {
  cd pyblock-$_tag
  patch -p1 < "$srcdir"/use_python2.patch
}

check() {
  cd pyblock-$_tag
  make
}

package() {
  cd pyblock-$_tag
  make install DESTDIR="$pkgdir"
}
