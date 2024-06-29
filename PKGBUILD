# Maintainer: Emil Bay <archlinux@tixz.dk>
# Contributor: Ramana Kumar <ramana@member.fsf.org>
# Contributor: JP-Ellis <josh@jpellis.me>
pkgname=lighthouse-ethereum-bin
_pkgname=lighthouse
pkgver=5.2.1
_pkgver=5.2.1
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
sha256sums_x86_64=('52fe38310856da8ce42618fdc966dd1d77c7f8db72ab18845d830b93e1ce6445'
                   'SKIP')
sha256sums_aarch64=('acad1a6503735477c9482c021bcedd0999a1f6dec78068e096fe3d92b67c2fdf'
                    'SKIP')

# Key can be imported with `gpg --recv-keys 15E66D941`
validpgpkeys=('15E66D941F697E28F49381F426416DC3F30674B0')

package() {
    install -D -m755 "$srcdir/lighthouse" "$pkgdir/usr/bin/lighthouse"
    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
