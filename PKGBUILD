# Maintainer: David Birks <david@birks.dev>

pkgname=gnome-shell-extension-material-shell
pkgver=7
pkgrel=1
pkgdesc='Tiling window extension for GNOME, following Material Design guidelines'
arch=('x86_64')
url='https://github.com/material-shell/material-shell'
license=('MIT')
conflicts=('gnome-shell-extension-material-shell-git')
depends=('gnome-shell>=3.34')
source=("$pkgname-$pkgver.tar.gz::https://github.com/material-shell/material-shell/archive/$pkgver.tar.gz")
b2sums=('cff31af604ce1751f14f99d4a8b2f9a3138f8f306bbb07fc866900b25aa3246fb3bfd01af16abfa520fbf1832e5592f1126623bb6ad986e2c793eb46ddcad435')

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

