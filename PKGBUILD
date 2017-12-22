pkgname=stellar-desktop-client
pkgver=3.3
pkgrel=1
pkgdesc="Full featured desktop client for Stellar cryptocurrency"
arch=('x86_64')
url="https://github.com/stellarchat/desktop-client"
license=('custom')
depends=()
optdepends=()
options=('!strip')
source=("https://github.com/stellarchat/desktop-client/releases/download/v${pkgver}/StellarDesktopLinux64-v${pkgver}.zip" stellar-desktop-client.desktop stellar-rocket-300.png)
sha512sums=('d8fa60926b49fb519de0c9927ca806d05ba27c268ed229fcf88eb1c38b8d266ee352c47cf59217ccf739137f3c973c6b09dca5c49e4c6407df3777e00324fc4e'
            'e1cca7b379afbd50f824cb8443dee8d754baa639afe1f403e945dece3550c95fef1f652ebfe569115e4020c371869f55c8d36ade80ed1f445875ef213d524507'
            'dd85aa2d597daae351d8f3d2d4ac589f646b42e929c7a7ad91a076ef26fae4c3a1acc44a11f83d7ab1ccbafd9f185208c7741220b7677080d257b2c431f8989b')

package() {
  install -d "$pkgdir/opt"
  cp -R "$srcdir/linux64" "$pkgdir/opt/stellar-desktop-client"
  install -d "$pkgdir/usr/bin"
  chmod +x "$pkgdir/opt/stellar-desktop-client/StellarWallet"
  ln -s /opt/stellar-desktop-client/StellarWallet "$pkgdir/usr/bin/stellar-desktop-client"

  install -D "$srcdir/stellar-rocket-300.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
