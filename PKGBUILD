# Maintainer: hosua <joshortiga777@gmail.com>
pkgname=terraprism-bin
_pkgname=terraprism
pkgver=0.13.0
pkgrel=1
pkgdesc="Terminal UI for viewing Terraform and OpenTofu plans (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/CaptShanks/terraprism"
license=('AGPL-3.0-or-later')
depends=('glibc')
optdepends=('terraform: plan, apply and state modes'
            'opentofu: plan, apply and state modes with tofu')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Releases ship bare binaries with no LICENSE or README, so those come from the tag.
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/CaptShanks/terraprism/v$pkgver/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/CaptShanks/terraprism/v$pkgver/README.md")
source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$_pkgname-linux-amd64")
source_aarch64=("$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$_pkgname-linux-arm64")
sha256sums=('483c367582e27b72d71f8e73efe26a2aaca5932435a94e651be4d541ffdf4d75'
            'eecd1f083c795e5d7fbe5f79749bb4cf8f31a0a639de3d10142920bf0fb8a538')
sha256sums_x86_64=('11fc842b3474fbed4783af177c1914fa72a79a21dddf9ac7f29d4a339ac661ab')
sha256sums_aarch64=('7a0e37e7f198745939f26377e9a1542d7e6d9d00ca9d50f80b10fc9fe5a103a1')
options=('!strip' '!debug')

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
