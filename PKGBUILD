# Maintainer: Brandon Milton <brandon.milton21@gmail.com>
pkgname=download-sweeper
pkgver=1.11
pkgrel=1
pkgdesc="A stale file archive and removal tool"
arch=('any')
url="https://github.com/brandonio21/download-sweeper"
license=('GPL')
depends=('python>=3' 'python-yaml')
source=("https://github.com/brandonio21/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('473a11e526a28821965239f525a280ed85cd10b232dfeb4d7d87d50174540ba6')

package() {
	cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/systemd/system

  install download_sweeper.py $pkgdir/usr/bin
  install download-sweeper.service $pkgdir/usr/lib/systemd/system/
  install download-sweeper.timer $pkgdir/usr/lib/systemd/system
}
