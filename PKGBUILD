# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='bw-pinentry'
pkgdesc='A pinentry wrapper around the bitwarden CLI to use your vault for GPG-Key storage.'
pkgver='1.0.9'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/bw-pinentry'
license=('BSD')
depends=('pinentry' 'bitwarden-cli')
source=("${pkgname}-${pkgver}-sources.tar.gz::https://github.com/Skycoder42/bw-pinentry/archive/refs/tags/v1.0.9.tar.gz"
        "${pkgname}-${pkgver}-linux.tar.xz::https://github.com/Skycoder42/bw-pinentry/releases/download/v1.0.9/bw_pinentry-1.0.9-linux.tar.xz")
b2sums=('859323c5317d9239d087ac82a6836e7a3736d454bc56698002699a554ccd99c2e713be14e1684795936c3bc8409ad7afd4bfd768807105ed179bd5f0df380e79'
        '6467f859fa313c7a01ff3ea8cfc6d0998196448fe2b69e71e681a1bc40cfbd0b0881b391110b4dc0804823ee3363e1105de26163a2fd120338e77622de6a2d7b')
changelog='CHANGELOG.md'
options=('!strip')
_pkgdir='bw-pinentry-1.0.9'

package_bw-pinentry() {
  install -d "$pkgdir/opt/$pkgname"
  cp -a 'bw_pinentry-1.0.9/.' "$pkgdir/opt/$pkgname/"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/"'bw-pinentry' "$pkgdir/usr/bin/"'bw-pinentry'
  cd "$_pkgdir"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

