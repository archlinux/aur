# Maintainer: Ash <xash at riseup d0t net>
pkgname=iw4x-launcher-bin
pkgver=1.1.8b16
_pkgtag=v1.1.8-b.16
_assetver=1.1.8-b.16
pkgrel=1
provides=('iw4x-launcher')
conflicts=('iw4x-launcher-git')
pkgdesc='iw4x updater & launcher (binary release)'
url='https://github.com/iw4x/launcher'
license=('GPL3')
arch=('x86_64')
depends=()
options=('!strip')

source=(
  "https://github.com/iw4x/launcher/releases/download/${_pkgtag}/launcher-${_assetver}-x86_64-linux-glibc.tar.xz"
  "LICENSE::https://raw.githubusercontent.com/iw4x/launcher/refs/heads/main/LICENSE.md"
)
sha256sums=('186d90064b93ec8c7270f6b04595a55e70b0d84e5f9bd03304ed94c678d4c2c3'
            'cc5470feed66192387f06ae93aed0bd4fefae5a5fd7c1e54a4acf4ea64f1028b')

package() {
  install -Dm755 \
    "$srcdir/launcher-${_assetver}-x86_64-linux-glibc /iw4x-launcher" \
    "$pkgdir/usr/bin/iw4x-launcher"

  install -Dm644 \
    "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
