pkgname=sendxmpp
pkgver=1.24
pkgrel=1
pkgdesc="A perl-script to send xmpp (jabber), similar to what mail(1) does for mail"
arch=('i686' 'x86_64')
url="https://sendxmpp.hostname.sk/"
license=('GPL')
depends=('perl' 'perl-net-xmpp' 'perl-io-socket-ssl')
options=('!emptydirs' 'docs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lhost/sendxmpp/archive/v$pkgver.tar.gz")
sha256sums=('dfaf735b4585efd6b3b0f95db31203f9ab0fe607b50e75c6951bc18a6269837d')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  perl Makefile.PL PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make install
  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
