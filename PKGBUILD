# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: scolobb <scolobb at colimite fr> #THX for the mirror
# Contributor: EEva <eeva+aur at marvid fr>

pkgname=ttf-montserrat
pkgver=7.200
pkgrel=3
_fontname=Montserrat
pkgdesc='Geometric font in many weights with Cyrillic and extended Latin support (Regular, Alternates), original concept by Julieta Ulanovsky'
url='http://montserrat.zkysky.com.ar/en'
arch=('any')
license=('custom:OFL')
source=("https://github.com/JulietaUla/${_fontname}/archive/v${pkgver}.tar.gz")
sha256sums=('340125df4700876c5adf4df98c885dbe9b96c8a6a0ee634a520934c77ee097dc')

package() {
  cd ${_fontname}-${pkgver}

  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  dst=${pkgdir}/usr/share/fonts/TTF
  mkdir -p ${dst}
  find ./fonts/ttf -name '*.ttf' -execdir install -m644 {} ${dst}/{} \;
}
