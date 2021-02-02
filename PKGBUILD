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
md5sums=('6234295ea3f56a621b70c74cced06fb4')

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
  install -Dm644 cine-encoder.png -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
  # install .desktop
  install -Dm644 cine-encoder.desktop -t "${pkgdir}/usr/share/applications/"
  # install sound
  install -Dm644 cine-encoder.wav -t "${pkgdir}/usr/share/sounds/"

}
