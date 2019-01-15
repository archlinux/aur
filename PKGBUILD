pkgname=stellar-desktop-client
pkgver=4.3
pkgrel=1
pkgdesc="Full featured desktop client for Stellar cryptocurrency"
arch=('x86_64')
url="https://github.com/stellarchat/desktop-client"
license=('custom')
depends=()
optdepends=()
options=('!strip')
source=("https://github.com/stellarchat/desktop-client/releases/download/nwjs-v${pkgver}/StellarDesktopLinux64-nwjs-v${pkgver}.zip" stellar-desktop-client.desktop stellar-rocket-300.png)
sha512sums=('8a069f25a104cd0ac48761b2bface5b8e1c42612dac0cee1496957edd9af424e74bda6a2352fe63b0d0983279d3759daa9df03568dce6b6f4385542c8d5c79c0'
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
