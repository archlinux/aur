# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=darkgates
_pkgname=DarkGates
pkgver=alpha_0.2.0
pkgrel=1
pkgdesc='You lead your team of 6 heroes into dungeon where they will fight their way trough in order to destroy Dark Gates and evil mage who is the master of the dungeon'
arch=('i686' 'x86_64')
url='http://darkgates.dfourgames.com/'
license=('custom')
groups=()
depends=(sh zlib hicolor-icon-theme)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install='darkgates.install'
source=(http://darkgates.dfourgames.com/download/${_pkgname}_${pkgver}.tar.gz
  darkgates.sh
  darkgates.desktop
)
noextract=()
build(){
  cd "$srcdir/"
  install -dm755 $pkgdir/opt/$pkgname
  cp -r ${_pkgname}_$pkgver/* $pkgdir/opt/$pkgname

  install -Dm644 $pkgdir/opt/$pkgname/LICENCE.txt \
    $pkgdir/usr/share/licenses/custom/$pkgname/LICENCE.txt
  install -Dm755 darkgates.sh $pkgdir/usr/bin/darkgates
  
  # Settings, everyone must be able to write
  chmod a+w $pkgdir/opt/$pkgname/settings.cfg 

  # desktop files and icons
  install -Dm644 darkgates.desktop "$pkgdir"/usr/share/applications/darkgates.desktop
  for _dim in 32x32 48x48 64x64 96x96 128x128; do
    install -Dm644 "$pkgdir"/opt/$pkgname/data/default/icons/icon${_dim}.png \
      "$pkgdir"/usr/share/icons/hicolor/${_dim}/apps/$pkgname.png
  done
}
md5sums=('2b1737b6556e489a19268694aa858a4a'
         '120df982c8bb68a41116454da262eb9b'
         '3430ccb16bb6494d4d81ef139cd15383')
md5sums=('2b1737b6556e489a19268694aa858a4a'
         '2e828dccefa0e6018601e73e8c697e1f'
         '3430ccb16bb6494d4d81ef139cd15383')
