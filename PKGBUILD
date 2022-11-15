# Maintainer:
# Contributor: aksr <aksr at t-com dot me>
pkgname=jchroot-git
pkgver=1.1.r1.g645c309
pkgrel=1
pkgdesc="A chroot with more isolation."
arch=('x86_64')
url="https://github.com/vincentbernat/jchroot"
license=('ISC')
makedepends=('git')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd jchroot
  git describe --long --tags | sed -e 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd jchroot
  make
}

package() {
  cd jchroot
  install -Dm755 jchroot $pkgdir/usr/bin/jchroot
  install -Dm644 jchroot.8 $pkgdir/usr/share/man/man8/jchroot.8
  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
}
