# Upstream Project Author: Hodong Kim <https://gitlab.com/hodong>
# PKGBUILD Author: Hodong Kim <https://gitlab.com/hodong>
# PKGBUILD Maintainer: Bumsik Kim <k.bumsik@gmail.com>

#
# PKGBUILD
# This file is part of Nimf.
#
# Unlike other files in the Nimf project,
# this PKGBUILD file is in the public domain.

pkgname=nimf
pkgver=2019.02.15	# This strictly follows AC_INIT field in configure.ac
pkgrel=1
pkgdesc="Nimf is an input method framework."
arch=('any')
url="https://gitlab.com/nimf-i18n/nimf"
license=('LGPL3')

# Reference: https://gitlab.com/nimf-i18n/nimf/blob/master/archlinux/PKGBUILD
makedepends=('binutils' 'autoconf' 'automake' 'gcc' 'make' 'glib2' 'intltool'
             'gtk3' 'gtk2' 'qt4' 'qt5-base' 'libappindicator-gtk3' 'librsvg'
             'noto-fonts-cjk' 'libhangul' 'anthy' 'librime' 'libxkbcommon'
             'wayland' 'libxklavier' 'm17n-lib')
depends=('glib2' 'gtk3' 'gtk2' 'qt4' 'qt5-base' 'libappindicator-gtk3'
         'libhangul' 'anthy' 'librime' 'libxkbcommon' 'wayland' 'libxklavier'
	 'm17n-lib')
optdepends=('brise: Rime schema repository'
            'noto-fonts-cjk: Google Noto CJK fonts')

source=("nimf-master::git+https://gitlab.com/nimf-i18n/nimf#commit=ea47e41a91ea57227202ced70186d21b0edff103")
md5sums=('SKIP')

build() {
	cd "$srcdir/nimf-master"
	./autogen.sh --prefix=/usr
	make -j 4
}

package() {
	cd "$srcdir/nimf-master"
	make DESTDIR="${pkgdir}/" install
}
