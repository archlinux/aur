# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='bw-pinentry'
pkgdesc='A pinentry wrapper around the bitwarden CLI to use your vault for GPG-Key storage.'
pkgver='1.0.8'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/bw-pinentry'
license=('BSD')
depends=('pinentry' 'bitwarden-cli')
source=("${pkgname}-${pkgver}-sources.tar.gz::https://github.com/Skycoder42/bw-pinentry/archive/refs/tags/v1.0.8.tar.gz"
        "${pkgname}-${pkgver}-linux.tar.xz::https://github.com/Skycoder42/bw-pinentry/releases/download/v1.0.8/bw_pinentry-1.0.8-linux.tar.xz")
b2sums=('5a02920bc3f08d315b39440907cc2a9d0ba7c592f9fe48f33bba764d4e3fc502dbd39af0a1643c82d2c95046487218d9e3dc38d32d8f8f2b626ba4fdc4bb8f0b'
        '23db05d278f16c6ae7eae4f8b49de080fc70635fad9296dae40bf7f4ef5ce09dbc31cfd5644a73bd98558ceae57bffc3d2072369d772c46719775e7e9b7485b5')
changelog='CHANGELOG.md'
options=('!strip')
_pkgdir='bw-pinentry-1.0.8'

package_bw-pinentry() {
  install -d "$pkgdir/opt/$pkgname"
  cp -a 'bw_pinentry-1.0.8/.' "$pkgdir/opt/$pkgname/"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/"'bw-pinentry' "$pkgdir/usr/bin/"'bw-pinentry'
  cd "$_pkgdir"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

