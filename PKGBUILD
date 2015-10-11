# Maintainer: Remy Adriaanse <remy@adriaanse.it>

pkgname=hudson
pkgver=3.3.1
pkgrel=1
pkgdesc="Extensible continuous integration server"
arch=('any')
url="http://hudson-ci.org"
license=('EPL')
depends=('java-runtime'
         'ttf-dejavu'
         'libcups')
backup=('etc/conf.d/hudson')
install=hudson.install
source=("http://hudson-ci.org/downloads/war/$pkgname-$pkgver.war"
        'hudson.conf'
        'hudson.service'
        'hudson.tmpfiles.d')
sha256sums=('1442d253e8b857cda2caa0f21e1a9e13a40485e476448d432ed90779a51e6c9b'
            '784a07d6d0cc2a1fd53114e765ccf44e022e9372c398bfacfa743e95eb7ddc40'
            '00a96b88bb9e98d14697e7e9eb443b0785f074eb1bbba207d3e7dd30d10ebbdf'
            'c61cbcf85c887379a605c1908b5474599b0fce25bd2f8dd567da3ace6a631b08')
noextract=("$pkgname-$pkgver.war")

package() {
  install -Dm444 "$srcdir/$pkgname-$pkgver.war" "$pkgdir/usr/share/java/hudson/hudson.war"
  install -Dm644 "$srcdir/hudson.service" "$pkgdir/usr/lib/systemd/system/hudson.service"
  install -Dm644 "$srcdir/hudson.tmpfiles.d" "$pkgdir/usr/lib/tmpfiles.d/hudson.conf"
  install -Dm644 "$srcdir/hudson.conf" "$pkgdir/etc/conf.d/hudson"
}
