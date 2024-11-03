pkgname=adventuresofdemo-assets
_pkgname=AdventuresofDemo-assets
pkgver=1.3.6.6
pkgrel=1
pkgdesc="Adventures of Demo assets"
arch=('any')
url="https://github.com/Wohlstand/TheXTech"
license=('GPL')
depends=('unzip')
source=("$url/releases/download/v$pkgver/thextech-adventure-of-demo-assets-full-v$pkgver.7z")
sha256sums=('32b45400148ce71290356b72d3967070f79d133eeb7f80a3c9bca78346003577')

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
