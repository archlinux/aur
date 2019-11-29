# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('psuinfo')
pkgver=1.1
pkgrel=1
pkgdesc="A psutil-based command to display customizable system info, intended for Tint2 or other panels"
arch=('x86_64')
url="https://github.com/nwg-piotr/psuinfo"
license=('GPL3')
depends=('python' 'python-psutil')

source=("https://github.com/nwg-piotr/psuinfo/archive/v$pkgver.tar.gz")

md5sums=('a163c69a438cc216ab278aeb623ba14d')

package() {
  install -D -m 755 "$pkgname"-"$pkgver"/psuinfo "$pkgdir"/usr/bin/psuinfo
  install -D -m 755 "$pkgname"-"$pkgver"/psuinfo.py "$pkgdir"/usr/share/"$pkgname"/psuinfo.py
  install -D -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"/icons/*.svg
  install -D -t "$pkgdir/usr/share/tint2" "$pkgname"-"$pkgver"/configs/*.tint2rc
}

