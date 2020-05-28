# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-carlito-ib
pkgver=20140820
pkgrel=1
depends=('fontconfig')
pkgdesc="A sans-serif font metrically compatible with Calibri"
url="https://code.google.com/p/chromium/issues/detail?id=280557"
arch=('any')
groups=('infinality-bundle-fonts')
license=('custom:OFL')
source=(http://mirrors.ctan.org/fonts/carlito.zip
        45-carlito.conf
        90-tt-carlito.conf)
sha1sums=('aac0d8641b385c334593118d5e7b4691d5435ef7'
          'ba31fb428eba83034a4d6edd31cb227d3045f2b5'
          '2ee9bcd6c28d0928d657d21c3a9ece5fb133c9c3')

package(){
  cd carlito

  install -D -m644 doc/LICENSE "${pkgdir}"/usr/share/fonts/"${pkgname}"/COPYING

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 truetype/*.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  cd "${srcdir}"
  install -D -m644 45-carlito.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-carlito.conf
  install -D -m644 90-tt-carlito.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-carlito.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-carlito.conf .
  ln -s ../conf.avail/90-tt-carlito.conf .
}
