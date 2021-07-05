# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_extname='nautilus-metadata-editor'
pkgname="${_extname}-git"
pkgver='3.28.1'
pkgrel=1
pkgdesc='Nautilus extension with simple Metadata Editor'
arch=('i686' 'x86_64')
url="https://gitlab.com/nvlgit/${_extname}-extension"
license=('GPL')
depends=('glib2' 'libnautilus-extension' 'taglib')
makedepends=('meson' 'vala')
conflicts=("${_extname}-git" "${_extname}-bin")
source=("git+https://gitlab.com/nvlgit/${_extname}-extension.git")
install="${_extname}.install"
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_extname}-extension"
	meson builddir --prefix=/usr
	ninja -C builddir
}

package() {
	cd "${srcdir}/${_extname}-extension"
	DESTDIR="$pkgdir" meson install -C builddir
}

