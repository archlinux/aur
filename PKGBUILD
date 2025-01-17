# Maintainer:
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Whemoon Jang <palindrom615@gmail.com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Contributor: Hodong Kim <https://gitlab.com/hodong>

pkgname=nimf
pkgver=1.3.7
pkgrel=1
epoch=1
pkgdesc='a lightweight, fast and extensible input method framework'
arch=(x86_64)
url="https://github.com/hamonikr/$pkgname"
license=(LGPL-3.0-only)
depends=(gtk3
         libappindicator-gtk3
         libxkbcommon
         libxklavier
         qt5-base
         wayland
         wayland-protocols)
makedepends=(anthy
             glib2-devel
             gtk-doc
             gtk2
             intltool
             libayatana-appindicator
             libhangul-git
             librime
             m17n-db
             m17n-lib
             librsvg)
optdepends=('brise: Rime schema repository'
            'noto-fonts-cjk: Google Noto CJK fonts')
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('17fbe0628d1dce17abb5413e370237908fd668533ddc398bf7996d9a8fda5d21')

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
