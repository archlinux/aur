# Contributor: L0cutus, <stefano.zamprogno@gmail.com>
pkgname=rdiff-backup-fs
pkgver=1.0.0
pkgrel=3
pkgdesc="Filesystem in userspace for rdiff-backup repositories"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rdiff-backup-fs/"
license=('GPL')
depends=('fuse' 'zlib')
source=(http://rdiff-backup-fs.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('c59fb6796ff4a70e0759fbc79b52db07')
sha512sums=('35d82ae183c559d93110f6ad0645e75e3fa02fea09194517488312c2c73a00cdcdadd3813a532f2eb986417b2af9dc245c298963bc8fb7758b54464d284db327')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}
