# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=kkrieger
pkgver=0.1
pkgrel=4
pkgdesc='Tiny first person shooter'
arch=('x86_64' 'i686')
url='http://www.pouet.net/prod.php?which=12036'
license=('freeware')
depends=('wine')
makedepends=('gendesk')
source=("$pkgname-$pkgver.zip::http://web.archive.org/web/20110717024227/http://kk.kema.at/files/$pkgname-beta.zip")
sha256sums=('367f28c37b8b4ed006205dcbdeae825e5341671d4b8f610db22c071aca379445')

build() {
  echo -e "#!/bin/sh\nwine /usr/share/kkrieger/kkrieger.exe" > kkrieger.sh
  gendesk -n
}

package() {
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 pno0001.exe "$pkgdir/usr/share/$pkgname/$pkgname.exe"
  install -Dm644 readme.txt "$pkgdir/usr/share/doc/$pkgname/readme.txt"
}
