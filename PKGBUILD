# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-triod-postnaja-ibx
pkgver=20110805
pkgrel=7
depends=('fontconfig')
pkgdesc="Attempts to mimic the typefaces used to publish Old Church Slavonic service books"
url="http://openfontlibrary.org/en/font/triod-postnaja"
arch=('any')
groups=('infinality-bundle-fonts-extra')
conflicts=('ttf-triod-postnaja')
license=('custom:OFL')
source=(http://openfontlibrary.org/assets/downloads/triod-postnaja/bb24f868ae4d904c0359d46c22e49c1e/triod-postnaja.zip
        45-triod-postnaja.conf
        90-tt-triod-postnaja.conf)
sha1sums=('cb085b03f590a4f0c0562732e1010dfc66e5397e'
          '08ad084d79d51f91a6d647045b1ce933a458520e'
          'b984296121412779bf6766247c969eae70310a7b')

package(){

  install -D -m644 LICENSE.txt \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -D -m644 TriodPostnaja.ttf \
    "${pkgdir}"/usr/share/fonts/"${pkgname}"/TriodPostanaja.ttf

  install -D -m644 45-triod-postnaja.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-triod-postnaja.conf
  install -D -m644 90-tt-triod-postnaja.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-triod-postnaja.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-triod-postnaja.conf .
  ln -s ../conf.avail/90-tt-triod-postnaja.conf .
}
