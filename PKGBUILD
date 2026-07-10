# Maintainer: EVAIT Security <info@evait-security.de>

pkgname=email_validator-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Fast, statically linked email list validator in Rust — with JSON output for n8n"
arch=('x86_64')
url="https://github.com/evait-security/email_validator"
license=('MIT')
provides=("email_validator")
conflicts=("email_validator")
source=("$pkgname-$pkgver::https://github.com/evait-security/email_validator/releases/download/v$pkgver/email_validator"
        "LICENSE")
noextract=("$pkgname-$pkgver")
# SHA256 updated after release binary is built
sha256sums=('8270a1f36fb178a9ac005414f703927e17b26a81813ca9d42a3da4196f38f391'
            '26bf0f953738341dc78504377cc5753cc2c61495683b8f94c8d90d395a5b4f88')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/email_validator"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
