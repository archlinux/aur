# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-playfair-display-ibx
pkgver=1.004
pkgrel=1
depends=('fontconfig')
pkgdesc="An Open Source typeface family for display and titling use"
url="http://www.forthehearts.net/"
arch=('any')
groups=('infinality-bundle-fonts-extra')
license=('custom:OFL')
source=(http://www.1001freefonts.com/d/5486/playfair-display.zip
        http://www.1001freefonts.com/d/5487/playfair-display-sc.zip
        45-playfair-display.conf
        90-tt-playfair-display.conf)
sha256sums=('7c580b65732f9a1b57a3f69a2115c6d22c93137ab34e20344488391d36d6959c'
            '81e8693edce210d3a2db4152b7bd8afa88ffb46139c6f5dead033a25f4bf1942'
            '8a895998b40d15219c974515c36af38a92b7acb00cd0df27a3fd52891e28606d'
            '433544aba28f32a2ea249aa3ac098d22e1ed9dc880475c77e010ddd096c9b438')

package(){

  install -D -m644 OFL.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -D -m644 45-playfair-display.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-playfair-display.conf
  install -D -m644 90-tt-playfair-display.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-playfair-display.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-playfair-display.conf .
  ln -s ../conf.avail/90-tt-playfair-display.conf .
}
