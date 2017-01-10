# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=metacity-themes
pkgver=3.18.4
pkgrel=3
pkgdesc="The standard Metacity themes"
arch=('any')
url="https://github.com/charlesbos/metacity-themes"
license=('GPL2')
conflicts=('gnome-themes-standard<3.16.0' 'metacity<3.20.0')
source=("https://github.com/charlesbos/${pkgname}/archive/${pkgver}.tar.gz"
        "modal-padding.patch")
sha256sums=('ecbb6e5b7ccdc0c7ad25dc240392e150578347f2dd69861d1c194e413b22ed90'
            '6f9dac1cad4ec07f0c9382cf7df0e62c199492530e3aa6bee0d103e72400dc39')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/modal-padding.patch"
}

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  themes=('Adwaita' 'AgingGorilla' 'Atlanta' 'Bright' 'Crux' 'Esco' 'HighContrast' 'Metabox' 'Simple')
  for x in "${themes[@]}"; do
    cp -r "${srcdir}/${pkgname}-${pkgver}/${x}" "${pkgdir}/usr/share/themes"
  done
}
