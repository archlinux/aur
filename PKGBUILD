# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: jorge_barroso <jorge.barroso.11@gmail.com>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>
pkgname=389-console
pkgver=1.1.18
pkgrel=1
pkgdesc="A Java based remote management console used for managing 389 Administration Server and 389 Directory Server."
arch=('any')
url="http://port389.org"
license=('GPL')
depends=('which' 'bash' 'idm-console-framework' 'java-environment')
makedepends=('apache-ant')
source=(http://directory.fedoraproject.org/sources/$pkgname-$pkgver.tar.bz2)
sha1sums=('ad6929bc9391d7b725aa8246fce5cc22225829b3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  /usr/share/apache-ant/bin/ant -Dbuilt.dir="built"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  install -Dm644 built/389-console "$pkgdir/usr/bin/389-console"
  install -Dm644 built/389-console_en.jar "$pkgdir/usr/share/java/389-console_en.jar"
  install -Dm644 389-console.8 "$pkgdir/usr/share/man/man8/389-console.8"
}

# vim:set ts=2 sw=2 et:
