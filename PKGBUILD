# Maintainer: Midov <midov@midov.pl>

pkgname=matrix-mirage
_name=mirage
pkgver=0.7.2
pkgrel=1
pkgdesc='A fancy, customizable, keyboard-operable Matrix chat client for encrypted and decentralized communication.'
arch=('any')
url='https://github.com/mirukana/mirage'
license=('LGPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-graphicaleffects' 'qt5-imageformats' 'python' 'python-pyotherside' 'libolm' 'libjpeg-turbo' 'zlib' 'libtiff' 'libwebp' 'openjpeg2' 'libmediainfo' 'python-pillow' 'python-pymediainfo' 'python-cairosvg' 'python-aiofiles' 'python-appdirs' 'python-filetype' 'python-html-sanitizer' 'python-lxml' 'python-mistune' 'python-blist' 'python-matrix-nio>=0.17.0' 'libxss' 'python-plyer' 'python-sortedcontainers' 'python-watchgod' 'python-redbaron' 'python-dbus' 'python-hsluv' 'python-pycryptodome' 'python-simpleaudio')
makedepends=('cmake' 'git')
conflicts=('mirage-matrix' 'matrix-mirage-git')
source=("git://github.com/mirukana/${_name}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
        cd ${srcdir}/"${_name}"
	git submodule update --init --recursive
}

build() {
        cd ${srcdir}/"${_name}"
	qmake PREFIX=/usr mirage.pro
	make
}

package() {
        cd ${srcdir}/"${_name}"
	make INSTALL_ROOT="${pkgdir}" install 
}
