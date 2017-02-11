# Maintainer: Radostin Stoyanov <rstoyanov1 at gmail dot com>
pkgname=antconc
pkgver=3.4.3
_appname=AntConc
_release=AntConc343
pkgrel=1
pkgdesc="A freeware corpus analysis toolkit for arrying out corpus linguistics research and data-driven learning."
arch=('any')
url="http://www.laurenceanthony.net/software/antconc/"
license=('')
groups=()
depends=('lib32-libxft' 'lib32-libxss')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=("!strip")
install=
changelog=
source=(http://www.laurenceanthony.net/software/antconc/releases/${_release}/${_appname}.tar.gz 
${pkgname}.png ${pkgname}.desktop)
noextract=()
md5sums=('5c7007b5e77b968e91b1c3c336bb2736'
         'c66bb375d318b0c36d61d79edd85fabf'
         'd03f3c6a67f0b97fe61f7bb97e2419d1')

build() {
  cd $srcdir/${_appname}
  rm ./*.txt
  rm ./*.png
}

package() {
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/{pixmaps,applications}

  cp $srcdir/${_appname}/${_appname} $pkgdir/usr/bin/${pkgname}

  cd $srcdir
  install -Dm644 ${pkgname}.png $pkgdir/usr/share/pixmaps/
  install -Dm644 ${pkgname}.desktop $pkgdir/usr/share/applications
}
