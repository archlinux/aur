# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=ledger-live-bin
pkgdesc='Ledger Hardware Wallet management software'
license=('MIT')
url='https://github.com/LedgerHQ/ledger-live-desktop'
pkgver=1.0.3
pkgrel=1
arch=('x86_64')
package="ledger-live-desktop-${pkgver}-linux-${arch}.AppImage"
options=(!strip)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${package}"
)
sha512sums_x86_64=(6fac1298dfd5be46d82b992a9f53d31fa5c451a85e6c1bc43b91d2783b00918544c7f65b62b5cdeec737fe4efae17249f64cf0d5ba78bd7ff05ca456c1331c0c)

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

