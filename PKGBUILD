pkgname=otf-noto-unicode
pkgver=7.2
pkgrel=1
pkgdesc='one Noto to rule them all'
arch=(any)
url='https://github.com/MY1L/Unicode'
source=(https://github.com/MY1L/Unicode/releases/download/NotoUni7/NotoUnicode-${pkgver}.otf
        46-noto-unicode.conf
        66-noto-unicode.conf)
sha256sums=('a90066de9c5cdfb3a417119a311277c1ebd278105c7dfa4a1e74418248169bc8'
            '055b7d0a079be4d0164b4a4c431e25cf5683710ab995bf4d704a17fbc3eb1be8'
            '3d8b705a13d1fbbdd16f3ef4fb30060bf26bb6a1ae5424a6e55edc89bda88036')

package() {
  install -Dm644 NotoUnicode-${pkgver}.otf -t "$pkgdir"/usr/share/fonts/OTF

  # Install fontconfig files
  install -Dm644 "$srcdir"/*-noto-unicode.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
