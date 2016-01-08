# Contributor: Alexander Mamzikov <av.mamzikov@gmail.com>

pkgname=transgui
pkgver=5.0.1
pkgrel=1
pkgdesc="A cross platform front-end for the Transmission Bit-Torrent client"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/transgui"
license=('GPL2')
groups=()
depends=()
makedepends=('lazarus>=1.0')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgver}/${pkgname}-${pkgver}-src.zip
    ${pkgname}.desktop)
noextract=()
md5sums=('471ed1f3f75a0ebcc9d3a0cb72f2a61c'
         '1220f32805a5afa6b41cc1a3894ede65') #generate with 'makepkg -g'

build() {
  cd "$srcdir/TransGUI"
  make
}

package()
{
  cd "${srcdir}/TransGUI"
  install -D ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -d lang "${pkgdir}/usr/share/${pkgname}/lang"
  install -D -m644 lang/* "${pkgdir}/usr/share/${pkgname}/lang/"
  install -D -m644 transgui.png "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -D -m644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
