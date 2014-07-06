# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Gonzalo Lorca <human at vtr.net>

pkgname=default_arm7
pkgver=0.5.25
pkgrel=1
pkgdesc="A very useful library for Nintendo DS homebrew development"
arch=('any')
url="http://www.devkitpro.org/"
license=('custom')
depends=('libnds' 'dswifi' 'maxmod')
options=(!strip)
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2")
sha256sums=('e69cc5d46aad9a53425b767687e0937024ad0e990af73be27faa5e437df63456')

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
