# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='bw-pinentry'
pkgname=('bw-pinentry' 'bw-pinentry-debug')
pkgdesc='A pinentry wrapper around the bitwarden CLI to use your vault for GPG-Key storage.'
pkgver='1.0.3'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/bw-pinentry'
license=('BSD')
depends=('pinentry' 'bitwarden-cli')
source=("sources.tar.gz::https://github.com/Skycoder42/bw-pinentry/archive/refs/tags/v1.0.3.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/bw-pinentry/releases/download/v1.0.3/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/bw-pinentry/releases/download/v1.0.3/binaries-linux-debug-symbols.tar.xz")
b2sums=('e8af65e2e526c708adff1872ca23b1053b03419b715996ffd56ddd27e189f58dc9ce5aa0f3aae861a7f4cd49d482494b5c1a1a3b9d9a873ab33a50e2cee95e4e'
        '7fbe4ab670fb75c74d96b07f76ec2a446eb79c46de42e516f59b9d26a9886cc3b2692aa0759f7d59cee4595a9f8b3a333bcfe8183691f15bae0154f3cda2eb13'
        'a4337b7ecfd46c0200d5d769e54d618f5e6658df3691abc79f2a3e50780d2d12b1e0521c298b4fb8ba2c9911c67b049365f151ce76325567705bbe3d5e76334a')
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

