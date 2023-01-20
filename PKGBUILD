# Maintainer: Matthew Blankenbehler <spectrino3d@gmail.com>
# Contributor: Julius de Jeu <julius@voidcorp.nl>

pkgname=powdertoy-jacobsmod-bin
pkgver=53.0
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air
    pressure, velocity & heat! Modded version by Jacob1"
arch=('x86_64')
url='https://powdertoy.co.uk/Discussions/Thread/View.html?Thread=11117'
license=('GPL3')
depends=('openssl')

source=("$pkgname-$pkgver.tar.gz::https://starcatcher.us/TPT/mod/Older/Jacob1's%20Mod%20ver%20$pkgver%20linux64.zip" powdertoy-jacobsmod.desktop jacobsmod)
sha256sums=('0532b642e2d4402f7e962968bfed9b57c78b70686efb6ee8cdf732b30ba79e1b' 'SKIP' 'SKIP')

prepare(){
  cp "${srcdir}/Jacob1's Mod" "${srcdir}/powder64-jacob"
}

package(){
  cd "${srcdir}"
  install -Dm 755 -t "${pkgdir}/usr/lib/powdertoy" powder64-jacob
  install -Dm 755 -t "${pkgdir}/usr/bin" jacobsmod
  install -Dm 644 -t "${pkgdir}/usr/share/applications" powdertoy-jacobsmod.desktop
}
