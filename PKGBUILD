# Maintainer: Heating Device <via DoT heatingdevice OT me DuT co m>
pkgname=tigcap
pkgver=0.0.2
pkgrel=1
pkgdesc="A powerful screenshot tool"
arch=('x86_64' 'armv7h')
url="https://github.com/theimgguru/tigcap/"
license=('GPL')
groups=()
depends=(maim)
makedepends=(npm nodejs)
optdepends=('libnotify: Notification support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/theimgguru/tigcap/archive/master.tar.gz)
noextract=()
md5sums=() #autofill using updpkgsums

build() {
  cd "$pkgname-master"

  npm install
}

package() {
  cd "$pkgname-master"

  node_modules/.bin/electron-packager . TIGCap --no-prune --out out --asar --overwrite
  mkdir -p $pkgdir/opt/tigcap

  cp -dr --no-preserve=ownership out/TIGCap-linux-*/* "$pkgdir/opt/tigcap"
  mkdir -p "$pkgdir/usr/share/applications"
  install TIGCap.desktop "$pkgdir/usr/share/applications"
}
md5sums=('afc09fcd821d11ae70556366bb6847e9')
md5sums=('afc09fcd821d11ae70556366bb6847e9')
