# Maintainer: EVAIT Security <info@evait-security.de>

pkgname=email_validator-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Fast, statically linked email list validator in Rust — CLI pipeline & HTTP API"
arch=('x86_64')
url="https://github.com/evait-security/email_validator"
license=('MIT')
provides=("email_validator")
conflicts=("email_validator")
source=("$pkgname-$pkgver::https://github.com/evait-security/email_validator/releases/download/v$pkgver/email_validator"
        "LICENSE")
noextract=("$pkgname-$pkgver")
# SHA256 updated after release binary is built
sha256sums=('7592907fe5e09b9dc9b823a817a127ffc0d7e6b0db938ff59515010fb9d57f1b'
            '26bf0f953738341dc78504377cc5753cc2c61495683b8f94c8d90d395a5b4f88')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/email_validator"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
