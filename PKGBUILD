# Maintainer: M0Rf30
# This file is part of BlackArch Linux ( http://blackarch.org ).
# See COPYING for license details.

pkgname='wifiphisher'
pkgver=1.1
pkgrel=1
groups=('blackarch' 'blackarch-wireless' 'blackarch-social')
pkgdesc='Fast automated phishing attacks against WPA networks.'
arch=('any')
url='https://github.com/sophron/wifiphisher'
license=('MIT')
depends=('python2' 'python2-httplib2' 'scapy' 'aircrack-ng')
makedepends=('git')
source=("https://github.com/sophron/wifiphisher/archive/v$pkgver.tar.gz"
	$pkgname.sh)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/wifiphisher"

  install -Dm644 README.md "$pkgdir/usr/share/doc/wifiphisher/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/wifiphisher"

  rm README.md LICENSE

  cp -a * "$pkgdir/usr/share/wifiphisher"
  cp ../$pkgname.sh "$pkgdir/usr/bin/wifiphisher"
  chmod a+x "$pkgdir/usr/bin/wifiphisher"
}

md5sums=('413c69ec546d647faca3120d9e074ba2'
         '20fc8c517c5e85c8a47e2372beecd83c')
