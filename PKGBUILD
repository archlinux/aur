# Maintainer: hertg <aur@her.tg>
# This file is generated automatically
_version=v0.2.0-rc.4
_versionWithoutPrefix=0.2.0-rc.4
_pkgname=lightdm-theme-neon
_pkgver=v0.2.0.rc.4
_source=${_pkgname}-${_version}::https://github.com/hertg/lightdm-neon/archive/refs/tags/v0.2.0-rc.4.tar.gz
pkgname=$_pkgname
pkgver=$_pkgver
pkgdesc='Modern and customizable theme for web-greeter with a nostalgic neon look'
pkgrel=1
arch=('any')
license=('GPL')
url='https://github.com/hertg/lightdm-neon'
makedepends=('npm' 'git')
optdepends=()
provides=()
conflicts=()
source=($_source)
sha256sums=('SKIP')

build() {
  cd $pkgname
  npm install
  npm run build
}

package() {
  cd $pkgname
  install -dm755 ${pkgdir}/usr/share/web-greeter/themes/neon
  cp -r public/. ${pkgdir}/usr/share/web-greeter/themes/neon
}