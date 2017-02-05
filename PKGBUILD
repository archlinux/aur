# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=metacity-themes
pkgver=3.18.11.1
pkgrel=1
pkgdesc="The standard Metacity themes"
arch=('any')
url="https://github.com/charlesbos/metacity-themes"
license=('GPL2')
conflicts=('gnome-themes-standard<3.16.0' 'metacity<3.20.0')
source=("https://github.com/charlesbos/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a4b39fdc47f9a7764d3d87f0212cf8f28c69c8efeef7a3e17ae466ba73fbb0d3')

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  themes=('Adwaita' 'AgingGorilla' 'Atlanta' 'Bright' 'Clearlooks' 'ClearlooksClassic'
          'Crux' 'Esco' 'Glider' 'Glossy' 'Gorilla' 'HighContrast' 'Inverted' 'Metabox' 
          'Mist' 'Simple' 'Unity')
  for x in "${themes[@]}"; do
    cp -r "${srcdir}/${pkgname}-${pkgver}/${x}" "${pkgdir}/usr/share/themes"
  done
}
