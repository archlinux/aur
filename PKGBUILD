# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=ledger-live-bin
pkgdesc='Ledger Hardware Wallet management software'
license=('MIT')
url='https://github.com/LedgerHQ/ledger-live-desktop'
pkgver=1.0.2
pkgrel=1
arch=('x86_64')
package="ledger-live-desktop-${pkgver}-linux-${arch}.AppImage"
options=(!strip)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${package}"
)
sha512sums_x86_64=(ffd077d6b8a974c59119501ad73004acb5ba949e44a40e4e4dd056ff1aad556a666253d4306348fd246237123a6087af9ad96d21e4995ac28d6559517a0f5c98)

#install=ledger-wallet-bin.install

package() {
  if [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin/"
  cp ${package} "$pkgdir/usr/bin/ledger-wallet"
  chmod +x $pkgdir/usr/bin/ledger-wallet
}

