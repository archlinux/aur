# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='bw-pinentry'
pkgname=('bw-pinentry' 'bw-pinentry-debug')
pkgdesc='A pinentry wrapper around the bitwarden CLI to use your vault for GPG-Key storage.'
pkgver='1.0.0'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/bw-pinentry'
license=('BSD')
depends=('pinentry' 'bitwarden-cli')
source=("sources.tar.gz::https://github.com/Skycoder42/bw-pinentry/archive/refs/tags/v1.0.0.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/bw-pinentry/releases/download/v1.0.0/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/bw-pinentry/releases/download/v1.0.0/binaries-linux-debug-symbols.tar.xz")
b2sums=('e9a6b4de85d710faec07f7e226c3a690042591ded65bdac712401213d56d7525f5a0bab17fcc48e1b6de27027156f23c62c2fe950e81f2ea928066587569b8fa'
        '9559866441dee37c8fbc53184190fe7cf03de494bb96122c1cb1787050c8b944cc6b498a9778a24929e8eeeef8869d5a02524663fd3e0af389f8d1503ecd5b97'
        '16faae6d5d66ca6d7bdf008485ded13836573d8be2b02b061b22afcbe905a20ff24ba2f2413a67fa63485c43facea5552937ba4601d441e06b14ffe473e3f14c')
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

