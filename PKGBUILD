# Maintainer: Helg1980 <depositmail@rambler.ru>
pkgname=cine-encoder
_name=${pkgname}
pkgver=3.0
pkgrel=1
pkgdesc="Cine Encoder 2020"
arch=(x86_64)
url="https://github.com/CineEncoder/cine-encoder.git"
license=('GPL3')
depends=('qt5-base>=5.15' 'mkvtoolnix-cli>=49.0' 'ffmpeg>=4.2' 'libmediainfo>=20.03')
source=("https://github.com/CineEncoder/cine-encoder/archive/3.0.tar.gz")
md5sums=('afd2613a53d939e237ca53070661e6e7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 cine_encoder "$pkgdir"/usr/bin/cine_encoder
  
  # install documentation
  install -Dm644 ABOUT -t "${pkgdir}/usr/share/doc/${pkgname}"
  # install license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # install icon
  install -Dm644 app/cine-encoder.png -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
  # install .desktop
  install -Dm644 app/cine-encoder.desktop -t "${pkgdir}/usr/share/applications/"

}
