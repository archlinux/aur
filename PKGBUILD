# Maintainer: hertg <aur@her.tg>
# This file is generated automatically via CI
pkgname=lightdm-theme-neon
pkgver=0.2.4
pkgdesc='Modern and customizable theme for web-greeter with a nostalgic neon look'
pkgrel=1
arch=('any')
license=('GPL')
url='https://github.com/hertg/lightdm-neon'
makedepends=('npm' 'git')
optdepends=()
provides=()
conflicts=()
source=("${pkgname}-0.2.4.tar.gz::https://github.com/hertg/lightdm-neon/archive/refs/tags/v0.2.4.tar.gz")
sha256sums=('SKIP')

build() {
  cd lightdm-neon-${pkgver}
  npm install
  npm run build
}

package() {
  # note: the directory is called "lightdm-neon-{version}", because the github 
  # archive extracts to a directory called "{repository}-{version}", not what
  # is specified in the source() of the PKGBUILD

  cd "${srcdir}/lightdm-neon-${pkgver}"
  install -dm755 "${pkgdir}/usr/share/web-greeter/themes/neon"
  cp -r public/. "${pkgdir}/usr/share/web-greeter/themes/neon"
}
