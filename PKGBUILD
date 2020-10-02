# Maintainer: Helg1980 <depositmail@rambler.ru>
pkgname=simplest-studio
_name=${pkgname}
pkgver=1.1
pkgrel=1
pkgdesc="Simplest Studio 2020SE"
arch=(x86_64)
url="https://github.com/SimplestStudio/simplest-studio.git"
license=('GPL3')
depends=('qt5-base>=5.15' 'ffmpeg>=4.2' 'libmediainfo>=20.03')
source=("https://github.com/SimplestStudio/simplest-studio/archive/1.1.tar.gz")
md5sums=('28b5322e17a2228af267a71f81cf4c0c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 simplest_studio "$pkgdir"/usr/bin/simplest_studio
  
  # install documentation
  install -Dm644 ABOUT -t "${pkgdir}/usr/share/doc/${pkgname}"
  # install license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # install icon
  install -Dm644 app/simplest-studio.png -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
  # install .desktop
  install -Dm644 app/simplest-studio.desktop -t "${pkgdir}/usr/share/applications/"

}
