# Maintainer: nazze <nazze at qq dot com>
# SPDX-License-Identifier: 0BSD
pkgname=agentero-cli-bin
pkgver=0.15.3
pkgrel=1
pkgdesc='Headless Vault and Catalog CLI for Agentero (official binary)'
arch=('x86_64')
url='https://github.com/poco-ai/Agentero'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("agentero-cli=$pkgver")
conflicts=('agentero-cli')
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/agentero-cli-$pkgver-x86_64-unknown-linux-gnu.tar.gz"
        "LICENSE-$pkgver::$url/raw/refs/tags/v$pkgver/LICENSE")
sha256sums=('52ddff3004232df5007792f0aa4c8a6a7dbf9f5a13d2e723717a9e395fc7cb16'
            'f2b7f0cc6fb11f63654ac171d46640de6a8f63407a1a9fa77181a5c43a841fcf')

package() {
    # Upstream archive uses agentero; reserve that name for the desktop app.
    install -Dm755 "$srcdir/agentero" "$pkgdir/usr/bin/agentero-cli"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
