# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=sipvicious
pkgver=0.3.0
pkgrel=3
pkgdesc="Set of security tools that can be used to audit SIP based VoIP systems"
arch=('any')
url="https://github.com/EnableSecurity/sipvicious"
license=('GPL3')
depends=('python>=3.6' 'python-scapy')
makedepends=('python-setuptools')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/EnableSecurity/sipvicious/archive/v$pkgver.tar.gz")
b2sums=('5ddcdf775db0ade6e61e77009c7991d8523db02dbdd6e8588c23f5cd6f4d2868dd1d78e7f17322cde67414b4eb2b8c89f2d4ee0079487e5f5f7ee75f4759adf5')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir"

  install -dm755 "$pkgdir/usr/share/man/man1"

  # Install svcrack
  gzip -c --best man1/svcrack.1 > "$pkgdir/usr/share/man/man1/svcrack.1.gz"
  install -Dm755 "$pkgdir/usr/bin/sipvicious_svcrack" "$pkgdir/usr/bin/svcrack"

  # Install svcrash
  gzip -c --best man1/svcrash.1 > "$pkgdir/usr/share/man/man1/svcrash.1.gz"
  install -Dm755 "$pkgdir/usr/bin/sipvicious_svcrash" "$pkgdir/usr/bin/svcrash"
  
  # Install svmap
  gzip -c --best man1/svmap.1 > "$pkgdir/usr/share/man/man1/svmap.1.gz"
  install -Dm755 "$pkgdir/usr/bin/sipvicious_svmap" "$pkgdir/usr/bin/svmap"
  
  # Install svreport
  gzip -c --best man1/svreport.1 > "$pkgdir/usr/share/man/man1/svreport.1.gz"
  install -Dm755 "$pkgdir/usr/bin/sipvicious_svreport" "$pkgdir/usr/bin/svreport"
  
  # Install svwar
  gzip -c --best man1/svwar.1 > "$pkgdir/usr/share/man/man1/svwar.1.gz"
  install -Dm755 "$pkgdir/usr/bin/sipvicious_svwar" "$pkgdir/usr/bin/svwar"
}
