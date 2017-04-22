# Maintainer: Randy Ramos <rramos1295 \at\ gmail \dot\ com>

pkgname='responder'
pkgver=2.3.3.6
pkgrel=1
pkgdesc='A LLMNR, NBT-NS and MDNS poisoner, with built-in HTTP/SMB/MSSQL/FTP/LDAP rogue authentication server supporting NTLMv1/NTLMv2/LMv2, Extended Security NTLMSSP and Basic HTTP authentication'
arch=('any')
depends=('python2')
makedepends=('git')
url='https://github.com/lgandx/Responder/'
license=('GPL3')
source=("https://github.com/lgandx/$pkgname/archive/v$pkgver.tar.gz" 'responder.sh')
sha256sums=('269245554f7d67ebc29c1f7c97f43521cd5c445fddd77f8c1bf733a3b43ca400'
			'3cb8d0c60e3ee5d985e7099eecbf0f0a5e24ffecd17078e8a19558b8f5c40e9a')

package() {
  cd "$srcdir/Responder-$pkgver"

  #Install directory and contents
  install -d "$pkgdir"/opt/responder
  cp -ar * "$pkgdir"/opt/responder/

  #Docs
  install -Dm644 README.md "$pkgdir"/usr/share/doc/responder/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/doc/responder/LICENSE

  #Script
  install -Dm755 "$srcdir"/responder.sh "$pkgdir"/usr/bin/responder
}
