pkgname=otf-adobe-source-code-vf
_tagname=2.042R-u/1.062R-i/1.026R-vf
pkgver=1.026
pkgrel=1
pkgdesc="Adobe' Monospaced font family for user interface and coding environments (Variable Font)"
url="https://adobe-fonts.github.io/source-code-pro/"
arch=(any)
license=(custom:SIL)
provides=(adobe-source-code-pro-fonts)
source=(https://github.com/adobe-fonts/source-code-pro/releases/download/$_tagname/VF-source-code-VF-1.026R.zip
        https://github.com/adobe-fonts/source-code-pro/raw/$_tagname/LICENSE.md
        66-source-code-vf-is-pro.conf)
sha256sums=('0660ba0cd1478f92cfcf2ad790b7aa29f8adb2daf15598f452a65ae61c9c9fb1'
            '7c940e28a5388e9bba866cf0e408edda45fe0899ba98665b8f6ab31dc5e4b8ff'
            'ee4e7dff09e342fb6b5300929a99a97465be576b04c9468af32630b9d9957afc')

package() {
  install -Dm644 VF/SourceCodeVF-*.otf -t "$pkgdir/usr/share/fonts/adobe-source-code-pro"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 66-source-code-vf-is-pro.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
