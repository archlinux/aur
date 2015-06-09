# Contributor: Daniel Milde <info@milde.cz>
pkgname=porrasturvat
pkgver=1.0.3
pkgrel=2
pkgdesc="Fall from stairs game"
arch=('i686' 'x86_64')
url="http://secretexit.com/freeware/stairdismount"
license=('custom')
[ "$CARCH" = "x86_64" ] && depends=('lib32-sdl_image' 'lib32-mesa' 'lib32-libstdc++5')
[ "$CARCH" = "i686" ] && depends=('sdl_image' 'mesa' 'libstdc++5')
source=(http://secretexit.com/files/${pkgname}-${pkgver}.tar.gz run.sh porrasturvat.desktop)
md5sums=('69ad633314430ee9fe5a51193e8ebc0e' 'e8234cc9c11268aaca5477f53d3422ef' 'd501918e420aff577e5ae7134acdfc56')

build() {
  cd ${srcdir}/${pkgname}
  msg "Installing Porrasturvat into /opt/porrasturvat"
  install -dm755 ${pkgdir}/opt/porrasturvat
  cp -R ./* ${pkgdir}/opt/porrasturvat
  
  msg "Installing run script into /usr/bin"
  install -D ${srcdir}/run.sh ${pkgdir}/usr/bin/porrasturvat
  
  msg "Installing desktop item"
  install -D ${srcdir}/porrasturvat.desktop ${pkgdir}/usr/share/applications/porrasturvat.desktop
}
