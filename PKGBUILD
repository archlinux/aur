# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Daniel Stumpner <bigstumpi@gmx.de>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=leet-plugins
_pkgname=LEET-plugins
pkgver=0.2
pkgrel=2
pkgdesc='LADSPA plugins especially for use with Ardour'
arch=('i686' 'x86_64')
url='http://code.google.com/p/leetplugins/'
license=('GPL2')
depends=('gcc-libs')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/leetplugins/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e2868cffe65a6fc4f7325ef1fb3831e1530718c75aa28c9cbb44f4399e5059a1')

build() {
  cd ${_pkgname}-${pkgver}
  make all
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm 755 LEET_chorus.so ${pkgdir}/usr/lib/ladspa/LEET_chorus.so
  install -Dm 755 LEET_eqbw2x2_1.so ${pkgdir}/usr/lib/ladspa/LEET_eqbw2x2_1.so
  install -Dm 755 LEET_eqbw2x2.so ${pkgdir}/usr/lib/ladspa/LEET_eqbw2x2.so
}
