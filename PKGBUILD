# Maintainer: realm2100
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Whemoon Jang <palindrom615@gmail.com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Contributor: Hodong Kim <https://gitlab.com/hodong>

pkgname=nimf
pkgver=1.4.19
pkgrel=1
epoch=1
pkgdesc='a lightweight, fast and extensible input method framework'
arch=(x86_64)
url="https://github.com/hamonikr/$pkgname"
license=(LGPL-3.0-only)
depends=('glib2' 'gtk3' 'qt5-base' 'qt6-base' 'libappindicator-gtk3' 'anthy' 'librime' 'libxkbcommon' 'wayland' 'libxklavier' 'm17n-lib' 'm17n-db')
makedepends=('binutils' 'autoconf' 'automake' 'gcc' 'make' 'glib2-devel' 'intltool' 'libayatana-appindicator' 'librsvg' 'noto-fonts-cjk' 'wayland-protocols' 'gtk-doc')
optdepends=('brise: Rime schema repository'
            'noto-fonts-cjk: Google Noto CJK fonts')
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('249d848f3517e3bd9e358d8da65e6c795f3b30473e719ed64c52b7a629857b7c')

prepare() {
	cd "$_archive"
	./autogen.sh
}

build() {
	cd "$_archive"
	./configure --prefix /usr
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir/" install
}
