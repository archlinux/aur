# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Gonzalo Lorca <human at vtr.net>

pkgname=default_arm7
pkgver=0.5.26
pkgrel=1
pkgdesc="A very useful library for Nintendo DS homebrew development"
arch=('any')
url="http://www.devkitpro.org/"
license=('custom')
depends=('libnds' 'dswifi' 'maxmod')
options=(!strip)
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2")
sha256sums=('f355f8ac617ccc4059e991ae479bc0d1572fe5dac555eea625125c7d07eaaa6d')

build() {
  source /etc/profile.d/devkitarm.sh
  make
}

package() {
  install -Dm755 default.elf "$pkgdir"/opt/devkitpro/libnds/default.elf
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -n 29 source/main.c > "$pkgdir"/usr/share/licenses/$pkgname/license
}
