# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=kkrieger
pkgver=0.1
pkgrel=2
pkgdesc='Tiny first person shooter'
arch=('x86_64' 'i686')
url='http://www.pouet.net/prod.php?which=12036'
license=('freeware')
depends=('wine')
makedepends=('gendesk')
source=("http://web.archive.org/web/20110717024227/http://kk.kema.at/files/$pkgname-beta.zip"
        "http://home.comcast.net/~supportcd/Icons/kkrieger.jpg"
        "$pkgname.sh")
sha256sums=('367f28c37b8b4ed006205dcbdeae825e5341671d4b8f610db22c071aca379445'
            '033ee829423d32986986a929fcb2f26c44714986852228c40be8673646fc0866'
            'd14adaf2e933da5cbe3db564b6fbc3fb970358112b5b59e24e86e7efbfbbcd44')
_name=('.kkrieger')

build() { 
  cd "$srcdir"
  gendesk -n
}

package() {
  cd "$srcdir"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 pno0001.exe "$pkgdir/usr/share/$pkgname/$pkgname.exe"
  install -Dm644 readme.txt "$pkgdir/usr/share/doc/$pkgname/readme.txt"
}

# vim:set ts=2 sw=2 et:
