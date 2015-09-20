# Maintainer: Roman Golovin <https://wiki.archlinux.org/index.php/Special:EmailUser/Dantix>

pkgname=ttf-weather-icons
pkgver=2.0.10
pkgrel=1

pkgdesc="Icon font with 222 weather themed icons"
url="https://erikflowers.github.io/weather-icons/"
license=('custom:"OFL"')

arch=('any')
source=("https://github.com/erikflowers/weather-icons/archive/$pkgver.tar.gz"
        "LICENSE::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=OFL_plaintext&filename=OFL.txt")
sha256sums=('51fc93425a61754b34ce298158de28984ad5904e58d42bbfc225704edde20d02' 'SKIP')
install=$pkgname.install

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd weather-icons-$pkgver/font
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF
}
