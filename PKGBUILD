# Maintainer: Helg1980 <depositmail@rambler.ru>
pkgname=cine-encoder
_name=${pkgname}
pkgver=3.1
pkgrel=1
pkgdesc="Cine Encoder 2021"
arch=(x86_64)
url="https://github.com/CineEncoder/cine-encoder.git"
license=('GPL3')
depends=('qt5-base>=5.15' 'mkvtoolnix-cli>=49.0' 'ffmpeg>=4.2' 'libmediainfo>=20.03')
source=("https://github.com/CineEncoder/cine-encoder/archive/3.1.tar.gz")
md5sums=('e1787d5c3ec800bf28a6818fec6e18a9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 cine_encoder "$pkgdir"/usr/bin/cine_encoder
  
  # install license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # install documentation
  install -Dm644 share/ABOUT -t "${pkgdir}/usr/share/doc/${pkgname}"
  
  # install .desktop
  install -Dm644 share/cine-encoder.desktop -t "${pkgdir}/usr/share/applications/"
  # install icon
  install -Dm644 share/cine-encoder.png -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
  # install sound
  install -Dm644 share/cine-encoder.wav -t "${pkgdir}/usr/share/sounds/"

}
