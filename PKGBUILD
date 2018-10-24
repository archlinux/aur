# Maintainer: Anton Semjonov < a**** \ät semjonov.de >

pkgname="imapfetch"
pkgdesc="Download all e-mails from an IMAP4 mailserver and store them locally in maildir format."

pkgver=0.1.0
pkgrel=1

arch=('any')
url="https://github.com/ansemjo/$pkgname"
license=('MIT')

depends=('python')
makedepends=()

provides=($pkgname)
conflicts=($pkgname)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0e59fd2e625c0f208e0702e1345090eb74c4a171077c1e6945bb9fc386752015')

package() {
  cd "$pkgname-$pkgver/"
  install -D -m 755 "${pkgname}/${pkgname}.py"    -T "${pkgdir}/usr/bin/${pkgname}"
  install -D -m 644 "assets/muttrc"               -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -D -m 644 "assets/settings.conf.sample" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -D -m 644 "README.md"                   -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
