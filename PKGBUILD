# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=gcfscape
pkgver=1.8.6
pkgrel=1
pkgdesc='An explorer for Half-Life file packages (bsp, gcf, vpk, wad, pak, etc)'
arch=('any')
url='https://nemstools.github.io/pages/GCFScape-Download.html'
license=('custom')
depends=('wine')
source=('http://nemstools.github.io/files/gcfscape186.zip'
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")
sha256sums=('5b61408a83b61afc9c775534cf02749edfde8e570bf17604bc191f6dc57055b0'
            'd557d4399cb3408394b3beb36080c3e3bc0c0ab5f1115ad60c3bca680d391cee'
            '42c09b6faf39e47abfa8a12eff248962c1075c7c674d303afb5207cbc44d8bc5'
            '5a013a743ed1155ed6fc6f3b96ad2ffef64a4e25be3a7e46f8c3f99a76f3e34e')

package() {
  install -Dd "$pkgdir/usr/share/${pkgname}"
  cp -r "$srcdir/x64" "$pkgdir/usr/share/${pkgname}"

  install -D "$srcdir/Readme.txt" "$pkgdir/usr/share/${pkgname}"

  install -Dm0644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm0644 "$srcdir/${pkgname}.png" "$pkgdir/usr/share/${pkgname}"
  install -Dm0755 "$srcdir/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
}
