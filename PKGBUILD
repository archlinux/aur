# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='bw-pinentry'
pkgname=('bw-pinentry' 'bw-pinentry-debug')
pkgdesc='A pinentry wrapper around the bitwarden CLI to use your vault for GPG-Key storage.'
pkgver='1.0.5'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/bw-pinentry'
license=('BSD')
depends=('pinentry' 'bitwarden-cli')
source=("sources.tar.gz::https://github.com/Skycoder42/bw-pinentry/archive/refs/tags/v1.0.5.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/bw-pinentry/releases/download/v1.0.5/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/bw-pinentry/releases/download/v1.0.5/binaries-linux-debug-symbols.tar.xz")
b2sums=('f0ff4eef304b1ee4f27c0cac787b2ae81cf484ff833cd36e72aa431a3ed01b20ea9743a88e3eea8fe67cc5db6a833b32fa4f443146a862859614095dc9a315a6'
        '256cf586e70e2f0a55ffe7567fb8baa750790e756f3a599fb9581faac5557f308c393b40fb5f28127c3fe118627803fc84cc9409b7f511d0f6b5cd83e83a13f1'
        'eaebe465f5130445487cdb50044148455d544dfa550bfe86ae73de858c276b58a8bd1942d40d92e0d4af6198ccd4016a2800c7c2880a1aea2e51d779b1de21ce')
changelog='CHANGELOG.md'
options=('!strip')
_pkgdir="$pkgbase-$pkgver"

package_bw-pinentry() {
  install -D -m755 'bw-pinentry' "$pkgdir/usr/bin/"'bw-pinentry'
  cd "$_pkgdir"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

package_bw-pinentry-debug() {
  install -D -m644 'bw-pinentry.sym' "$pkgdir/usr/lib/debug/usr/bin/"'bw-pinentry'.sym
  cd "$_pkgdir"
  find . -exec install -D -m644 "{}" "$pkgdir/usr/src/debug/$pkgbase/{}" \;
}

