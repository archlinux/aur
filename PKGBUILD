# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='bw-pinentry'
pkgname=('bw-pinentry' 'bw-pinentry-debug')
pkgdesc='A pinentry wrapper around the bitwarden CLI to use your vault for GPG-Key storage.'
pkgver='1.0.1'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/bw-pinentry'
license=('BSD')
depends=('pinentry' 'bitwarden-cli')
source=("sources.tar.gz::https://github.com/Skycoder42/bw-pinentry/archive/refs/tags/v1.0.1.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/bw-pinentry/releases/download/v1.0.1/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/bw-pinentry/releases/download/v1.0.1/binaries-linux-debug-symbols.tar.xz")
b2sums=('31a5b2fe5358c694beb913d80a71e20c6741ee8d6cfe903e4aa3f87618af044976f5595173fd4151cd330dfbe6569b369ebd12daddcd331086037497be4650d4'
        '08d631c6be871665736bd5fddae5290440f75d5a7edf219803f225564bd147179bc957ed651595300ce4950faa7b7bd0669a527077805ba60dcad9d78f1fa444'
        'c9f3b24e387a047c88a2c300c86e2934ed9e9caf96ae842c95bc78eb1a671724dcff717c3561b58769ee5b13721f6dae72c82bace0e5d7db08cca46de4d1d4e8')
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

