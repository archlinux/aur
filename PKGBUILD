# Maintainer: Evgeniy <genues@gmail.com>
pkgname=opensmtpd-filter-replace-from_reply
pkgver=1.0.5
pkgrel=3
pkgdesc='This is a simple OpenSMTPD filter for overwriting the email address in the MAIL FROM command, in the header in all sent messages, as well as for substituting the original MAIL FROM address in the Reply-To field'
license=("MIT")
arch=(i686 x86_64)
depends=(glibc)
makedepends=(go)
source=("https://github.com/Genues/opensmtpd-filter-replace-from_reply/archive/$pkgver.zip")
md5sums=('3190efaeb93dbaee48ae68a8aee89cba')

build() {
cd "$pkgname-$pkgver"
go build -buildmode=pie -trimpath "$pkgname.go"
}

package() {
cd "$pkgname-$pkgver"

install -D "$pkgname" -t "$pkgdir"/usr/lib/smtpd/opensmtpd
install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}