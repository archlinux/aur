# Maintainer: urklang <nicolas at zrna dot org>
# Contributor: urklang <nicolas at zrna dot org>
pkgname=terminatorx
pkgnamecap=terminatorX
pkgver=4.0.1
pkgrel=1
pkgdesc="Turntable scratching synthesizer"
arch=('x86_64')
url="https://terminatorx.org/"
license=('GPL2')
builddepends=(
    'alsa-lib'
    'audiofile'
    'desktop-file-utils'
    'gtk3'
    'jack'
    'ladspa'
    'libcap'
    'liblrdf'
    'libmad'
    'libvorbis'
    'libxml2'
    'libX11'
    'mpg123'
    'pulseaudio'
    'rarian'
    'sox'
    'vorbis-tools'
    'gcc-libs'
    'glibc'
    'gnome-doc-utils')
    
depends=('mpg123' 'sox' 'vorbis-tools')

options=()
source=("https://terminatorx.org/dist/$pkgnamecap-$pkgver.tar.gz")
sha512sums=('dae7d401870db39692d57e1fe5df47be7b50179a8cd739b60bdfda211cbe29e8abdc116bda23a286ddf49533e76175ac2a5811e0516b1a7d50b7873f7db4715b')

prepare() {
	cd "$pkgnamecap-$pkgver"
}

build() {
	cd "$pkgnamecap-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgnamecap-$pkgver"
	make -k check
}

package() {
	cd "$pkgnamecap-$pkgver"
	make DESTDIR="$pkgdir/" install
}