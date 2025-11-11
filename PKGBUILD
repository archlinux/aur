# Maintainer: Emil Bay <archlinux@tixz.dk>
# Contributor: Ramana Kumar <ramana@member.fsf.org>
# Contributor: JP-Ellis <josh@jpellis.me>
pkgname=lighthouse-ethereum-bin
_pkgname=lighthouse
pkgver=8.0.0
_pkgver=8.0.0
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
sha256sums_x86_64=('37e00d9bc1beaf6eab6777edebf2e13c7daea21b3dce356034f521c34fd447f6'
                   'SKIP')
sha256sums_aarch64=('26daf7fc1e48c069c45b0845cf24167e6ed5be5c6a6705f3780abb7b919ddd37'
                    'SKIP')

# Key can be imported with `gpg --recv-keys 15E66D941`
validpgpkeys=('15E66D941F697E28F49381F426416DC3F30674B0')

package() {
    install -D -m755 "$srcdir/lighthouse" "$pkgdir/usr/bin/lighthouse"
    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
