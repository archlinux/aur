# Maintainer: Lukas Matt <lukas@matt.wf>
pkgname=sshfsmux
pkgver=1.2
pkgrel=3
pkgdesc="Multiplexer client based on the Secure Shell FileSystem"
arch=('x86_64')
url="https://code.google.com/archive/p/sshfsmux/"
license=('GPL')
depends=('fuse2' 'glib2')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/sshfsmux/$pkgname-$pkgver.tar.gz")
md5sums=('7aaaa74c2b7d06266ed3c25bc5971b28')
validpgpkeys=('1E9E2C1BCF7639B219FBE159903A00FC06CC137B')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
