# Maintainer: Brandon Milton <brandon.milton21@gmail.com>
pkgname=download-sweeper
pkgver=1.12
pkgrel=4
pkgdesc="A stale file archive and removal tool"
arch=('any')
url="https://github.com/brandonio21/download-sweeper"
license=('GPL')
depends=('python' 'python-yaml')
source=("https://github.com/brandonio21/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('455a717cce5c35ce44e942702bc76bebe51536f2b956bb20a4250e1fa815042f')

package() {
	cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/systemd/user

  install download_sweeper.py $pkgdir/usr/bin
  cp download-sweeper.service $pkgdir/usr/lib/systemd/user
  cp download-sweeper.timer $pkgdir/usr/lib/systemd/user
}
