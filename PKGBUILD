pkgname=adventuresofdemo-assets
_pkgname=AdventuresofDemo-assets
pkgver=1.3.6.5
pkgrel=1
pkgdesc="Adventures of Demo assets"
arch=('any')
url="https://github.com/Wohlstand/TheXTech"
license=('GPL')
depends=('unzip')
source=("$url/releases/download/v$pkgver/thextech-adventure-of-demo-assets-full.7z")
sha256sums=('8b8a2708acf6ffd577b5823ca7f66e5e17e914db2c803f47d8b00065829c3599')

package() {
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"

    # Packaging files
    cd $srcdir
    for dir in *; do
      if [[ -d "$dir" ]]; then
      cp -r "$dir" "$pkgdir/usr/share/games/$_pkgname"
     fi
    done
    cp *.{txt,ini,lvlx} "$pkgdir/usr/share/games/$_pkgname"
}
