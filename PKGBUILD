# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
# Former Maintainer: Shawn Nock <shawn@monadnock.ca>
pkgname=littlefs-fuse
pkgver=2.4.0
pkgrel=1
pkgdesc="A FUSE wrapper that puts the littlefs in user-space"
url="https://github.com/littlefs-project/littlefs-fuse"
arch=(x86_64)
license=(BSD)
depends=(fuse2)

source=(https://github.com/littlefs-project/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=(219d6e44c3925cbd25118c306f2c1f048a7119173ca0e1ac1752f20099ddf06d)

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  src=$srcdir/$pkgname-$pkgver
  install -Dm 755 $src/lfs -t $pkgdir/usr/bin
  install -Dm 644 $src/LICENSE.md -t $pkgdir/usr/share/licences/$pkgname
  install -Dm 644 $src/README.md -t $pkgdir/usr/share/doc/$pkgname
}
