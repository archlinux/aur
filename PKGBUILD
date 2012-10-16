# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=wikipediafs
pkgver=0.4
pkgrel=1
pkgdesc="Mount Wikipedia/Mediawiki sites locally via FUSE"
arch=('any')
url="http://wikipediafs.sourceforge.net/"
license=('GPL')
depends=('fuse' 'python2-fuse')
source=("http://downloads.sourceforge.net/wikipediafs/$pkgname-$pkgver.tar.gz")
sha256sums=('8c9de78dd92354877a8d604f3128238f10cd6c06d594ddc23c06552cc7c731f1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mkdir "$pkgdir/sbin"
  ln -s /usr/bin/mount.wikipediafs "$pkgdir/sbin/mount.wikipediafs"
}

# vim:set ts=2 sw=2 et:
