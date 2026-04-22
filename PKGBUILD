# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='bw-pinentry'
pkgdesc='A pinentry wrapper around the bitwarden CLI to use your vault for GPG-Key storage.'
pkgver='1.0.6'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/bw-pinentry'
license=('BSD')
depends=('pinentry' 'bitwarden-cli')
source=("${pkgname}-${pkgver}-sources.tar.gz::https://github.com/Skycoder42/bw-pinentry/archive/refs/tags/v1.0.6.tar.gz"
        "${pkgname}-${pkgver}-linux.tar.xz::https://github.com/Skycoder42/bw-pinentry/releases/download/v1.0.6/bw_pinentry-1.0.6-linux.tar.xz")
b2sums=('87c97538dabaa99ec24ae88fea1b62300100731f1f509d430835d97a6b2601dcb22712b751b912221f437f744c231305bd53ebba5ee088df48413225803844ae'
        'ed1185f18031287e9e7858e6b42223bf75f501bb4eeeed153365066b432c7ef472527a340a21c6a5208019819939472d293a8910282356679b84844f70e25d84')
changelog='CHANGELOG.md'
options=('!strip')
_pkgdir='bw-pinentry-1.0.6'

package_bw-pinentry() {
  install -d "$pkgdir/opt/$pkgname"
  cp -a 'bw_pinentry-1.0.6/.' "$pkgdir/opt/$pkgname/"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/"'bw-pinentry' "$pkgdir/usr/bin/"'bw-pinentry'
  cd "$_pkgdir"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

