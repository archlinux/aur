# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=ledger-live-bin
pkgdesc='Ledger Hardware Wallet management software'
license=('MIT')
url='https://github.com/LedgerHQ/ledger-live-desktop'
pkgver=1.0.1
pkgrel=1
arch=('x86_64')
package="ledger-live-desktop-${pkgver}-linux-${arch}.AppImage"
options=(!strip)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${package}"
)
sha512sums_x86_64=(afde4cb9a7eeb7423555e4344009e6be5f23e2b9840efd1cd020fba49cad5eed776eb6b11b715d58c40ff49f7315214f5219984196a7b0d92648f9e31a31a7c5)

#install=ledger-wallet-bin.install

package() {
  if [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cd "$srcdir"
  mkdir -p "$pkgdir/usr/local/bin/"
  cp ${package} "$pkgdir/usr/local/bin/ledger-wallet"
  chmod +x $pkgdir/usr/local/bin/ledger-wallet
}

