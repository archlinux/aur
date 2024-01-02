# Maintainer: emilweth <coucou@emi.cool>
pkgname=eco
pkgver=0.10.0.3
pkgrel=1
pkgdesc="Eco game client"
arch=('x86_64')
url="https://play.eco"
license=("All rights reserved")
source=(
file://EcoLinux_v${pkgver}-beta.zip
eco.desktop
logo.png
)
sha256sums=('5b7cc4ffe7894b1bfb465100c18f3e9e03cedfe71ce8e40cbed3dded3716333f'
            '5a34ccaf9bce359768fb900a948cdc715d138800491b4f017effbcff27ab9fc0'
            'bfa1088a624021b3e47f67f61c40a8dae71672f632ddab6e049669c19e2e9670')

build() {
  cd "$srcdir"
}

package () {

  cd "$pkgdir"
  
  mkdir -p "opt"

  install -Dm644 "$srcdir/logo.png" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/eco.png"

  install -Dm644 "$srcdir/eco.desktop" "$pkgdir/usr/share/applications/eco.desktop"

  cp -R "$srcdir" "$pkgdir/opt/$pkgname"
  chmod +x "$pkgdir/opt/$pkgname/Eco.x86_64"
  
}
