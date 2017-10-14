# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Gonzalo Lorca <human at vtr.net>

pkgname=default_arm7
pkgver=0.7.3
pkgrel=1
pkgdesc="A very useful library for Nintendo DS homebrew development"
arch=('any')
url="http://devkitpro.org"
license=('custom')
depends=('libnds' 'dswifi' 'maxmod')
options=(!strip)
source=("https://github.com/devkitPro/default-arm7/releases/download/v$pkgver/default_arm7-src-$pkgver.tar.bz2")
sha256sums=('a70246c086692fd9f21245f8ff2b2d2e0290822d933c5ead647bf7417b899d62')

build() {
  # set environment
  source /etc/profile.d/devkitarm.sh

  make
}

package() {
  install -Dm755 default.elf "$pkgdir"/opt/devkitpro/libnds/default.elf
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -n 29 source/main.c > "$pkgdir"/usr/share/licenses/$pkgname/license
}
