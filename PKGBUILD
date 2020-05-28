# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-signika-family-ib
pkgver=1.0001
pkgrel=9
depends=('fontconfig')
pkgdesc="A sans-serif developed for wayfinding, signage, and other media prioritizing clarity"
groups=('infinality-bundle-fonts-extra')
conflicts=('ttf-google-webfonts-git' 'otf-signika-family-ib')
replaces=('otf-signika-family-ib' 'ttf-signika-family-ibx')
url="http://fontfabric.com/signika-font/"
arch=('any')
license=('custom:OFL')
#http://fonts.google.com/speciemen/Signika
source=('Signika.zip::https://fonts.google.com/download?family=Signika'
        45-signika.conf
        90-tt-signika.conf)
sha256sums=('e9f6c1722d7df7f5d6e5802df08f01130b8683d5dc7e6fd61262cf6be906f183'
            'd2425f0d723f72db90e00f323aaa83610a067fe244bcaf13b9dde58a902f0e39'
            'b5aa77899c9b3511adcb6a8cdd4b09c654913a9d3266207c0d8de381d4e7ea8a')

package(){
  cd $srcdir
  install -D -m644 OFL.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -D -m644 45-signika.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-signika.conf
  install -D -m644 90-tt-signika.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-signika.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-signika.conf .
  ln -s ../conf.avail/90-tt-signika.conf .
}
