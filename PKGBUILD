# Maintainer: Julius de Jeu <julius@voidcorp.nl>

pkgname=powdertoy-jacobsmod-bin
pkgver=49.2
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air
    pressure, velocity & heat! Modded version by Jacob1"
arch=('x86_64')
url='https://powdertoy.co.uk/Discussions/Thread/View.html?Thread=11117'
license=('GPL3')
depends=('openssl')

source=("$pkgname-$pkgver.tar.gz::https://starcatcher.us/TPT/mod/Older/Jacob1's%20Mod%20ver%20$pkgver%20linux64.zip" powdertoy-jacobsmod.desktop jacobsmod)
md5sums=('047ad443bcee39588c18911b59f8ea35' 'SKIP' 'SKIP')

prepare(){
  cp "${srcdir}/Jacob1's Mod" "${srcdir}/powder64-jacob"
}

package(){
  cd "${srcdir}"
  install -Dm 755 -t "${pkgdir}/usr/lib/powdertoy" powder64-jacob
  install -Dm 755 -t "${pkgdir}/usr/bin" jacobsmod
  install -Dm 644 -t "${pkgdir}/usr/share/applications" powdertoy-jacobsmod.desktop
}
