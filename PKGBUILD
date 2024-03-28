# Maintainer: Emil Bay <archlinux@tixz.dk>
# Contributor: Ramana Kumar <ramana@member.fsf.org>
# Contributor: JP-Ellis <josh@jpellis.me>
pkgname=lighthouse-ethereum-bin
_pkgname=lighthouse
pkgver=5.1.3
_pkgver=5.1.3
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
sha256sums_x86_64=('9426e42b94cc435d51bc7c86d0c30383c2243e4fa83cc3e7403189b4683cbeeb'
                   'SKIP')
sha256sums_aarch64=('30ab15fa1873bd1b0f0a37b4251b17047f25bf83dcf2e125493b07423d6e758e'
                    'SKIP')

# Key can be imported with `gpg --recv-keys 15E66D941`
validpgpkeys=('15E66D941F697E28F49381F426416DC3F30674B0')

package() {
    install -D -m755 "$srcdir/lighthouse" "$pkgdir/usr/bin/lighthouse"
    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
