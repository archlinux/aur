# Maintainer: Roman Holovin <https://wiki.archlinux.org/index.php/Special:EmailUser/Dantix>

pkgname=ttf-weather-icons
pkgver=2.0.12
pkgrel=1

pkgdesc="Icon font with 222 weather themed icons"
url="https://erikflowers.github.io/weather-icons/"
license=('custom:"OFL"')

arch=('any')
source=("ttf-weather-icons-$pkgver.tar.gz::https://github.com/erikflowers/weather-icons/archive/$pkgver.tar.gz"
        "LICENSE")
sha256sums=(
  'e6a0693ec10ba423f26b7e6abcbf67ea7bec69fc0afaabb0ddd62799cdc91223'
  'ce243fd4a62b1b76c959ffba6ec16a7a3146b2362d441ae4f9f7f32fc3750d6c')

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd weather-icons-$pkgver/font
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF
}
