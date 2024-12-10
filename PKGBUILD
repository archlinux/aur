# Maintainer: Emil Bay <archlinux@tixz.dk>
# Contributor: Ramana Kumar <ramana@member.fsf.org>
# Contributor: JP-Ellis <josh@jpellis.me>
pkgname=lighthouse-ethereum-bin
_pkgname=lighthouse
pkgver=6.0.0
_pkgver=6.0.0
pkgrel=1
pkgdesc='Ethereum 2.0 client'
arch=('x86_64' 'aarch64')
url='https://lighthouse.sigmaprime.io/'
license=('Apache-2.0')
depends=('openssl')
provides=('lighthouse')
conflicts=('lighthouse')
source=("https://raw.githubusercontent.com/sigp/lighthouse/stable/LICENSE")
source_x86_64=("https://github.com/sigp/lighthouse/releases/download/v${_pkgver}/lighthouse-v${_pkgver}-x86_64-unknown-linux-gnu.tar.gz" "https://github.com/sigp/lighthouse/releases/download/v${_pkgver}/lighthouse-v${_pkgver}-x86_64-unknown-linux-gnu.tar.gz.asc")
source_aarch64=("https://github.com/sigp/lighthouse/releases/download/v${_pkgver}/lighthouse-v${_pkgver}-aarch64-unknown-linux-gnu.tar.gz" "https://github.com/sigp/lighthouse/releases/download/v${_pkgver}/lighthouse-v${_pkgver}-aarch64-unknown-linux-gnu.tar.gz.asc")
sha256sums=('91d7b651aa6c6ffe6c36445f2652b49ff86134f6dc558a8bf35a8d407dfe2578')
sha256sums_x86_64=('d07a771b9d123036eebb26d721f09bd32d8a9616c3d5f9d628e6f8131a12df90'
                   'SKIP')
sha256sums_aarch64=('477c8c6296c81df5227c2da3cbea272d313a2584f5b85bf0719e40050c090031'
                    'SKIP')

# Key can be imported with `gpg --recv-keys 15E66D941`
validpgpkeys=('15E66D941F697E28F49381F426416DC3F30674B0')

package() {
    install -D -m755 "$srcdir/lighthouse" "$pkgdir/usr/bin/lighthouse"
    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
