# Maintainer: David Birks <david@birks.dev>

pkgname=gnome-shell-extension-material-shell
pkgver=9
pkgrel=1
pkgdesc='Tiling window extension for GNOME, following Material Design guidelines'
arch=('x86_64')
url='https://github.com/material-shell/material-shell'
license=('MIT')
conflicts=('gnome-shell-extension-material-shell-git')
depends=('gnome-shell>=3.34')
source=("$pkgname-$pkgver.tar.gz::https://github.com/material-shell/material-shell/archive/$pkgver.tar.gz")
b2sums=('2c2480ed6a92f433607d73267058625441b62147cb3567c6b06f26ee3a2424f754d0e39821d02da908ad0449ec064cd2c19ad5e1e4affe02cc373631e38082e7')

package() {
    cd "$srcdir"/material-shell-$pkgver

    local FILES="
      *.js
      *.css
      assets/
      metadata.json
      schemas/
      src/
    "

    for file in $FILES
    do
      mkdir -p "$pkgdir"/usr/share/gnome-shell/extensions/material-shell@papyelgringo/
      cp -r $file "$pkgdir"/usr/share/gnome-shell/extensions/material-shell@papyelgringo/
    done

    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

