pkgname=stellar-desktop-client
pkgver=4.0
pkgrel=1
pkgdesc="Full featured desktop client for Stellar cryptocurrency"
arch=('x86_64')
url="https://github.com/stellarchat/desktop-client"
license=('custom')
depends=()
optdepends=()
options=('!strip')
source=("https://github.com/stellarchat/desktop-client/releases/download/v${pkgver}/StellarDesktopLinux64-v${pkgver}.zip" stellar-desktop-client.desktop stellar-rocket-300.png)
sha512sums=('b71b340f6982616c65401e45209ab1b530e3a41ded3b49f0e671fd3d1be04848b95080e6a90b19f3569a619a6495132af164bcbd0c23377843e2f0396819f66a'
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
