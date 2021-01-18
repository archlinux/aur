# Maintainer: Anton Semjonov < a**** \ät semjonov.de >

pkgname="imapfetch"
pkgdesc="Download all e-mails from an IMAP4 mailserver and store them locally in maildir format."

pkgver=0.2.4
pkgrel=1

arch=('any')
url="https://github.com/ansemjo/$pkgname"
license=('MIT')

depends=('python')
makedepends=()

provides=($pkgname)
conflicts=($pkgname)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b76edba5eb04cc45a6a24d5c1cea00a6ffe302609c90b2a24fa6ba5ca451d741')

package() {
  cd "$pkgname-$pkgver/"
  install -D -m 755 "${pkgname}/${pkgname}.py"    -T "${pkgdir}/usr/bin/${pkgname}"
  install -D -m 644 "assets/muttrc"               -T "${pkgdir}/usr/share/doc/${pkgname}/muttrc"
  install -D -m 644 "assets/settings.conf.sample" -T "${pkgdir}/usr/share/doc/${pkgname}/imapfetch.conf.sample"
  install -D -m 644 "README.md"                   -T "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
