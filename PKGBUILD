# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=wayward-git
_realname=wayward
pkgver=1.1.0
pkgrel=1
pkgdesc="Fast GTK shell and compositor for wayland and weston."
arch=('x86_64')
license=('GPL')
url="https://github.com/varmd/wayward"
depends=('weston' 'wayland' 'ttf-droid' 'adwaita-icon-theme' 'librsvg' 'sudo' 'alsa-lib')
makedepends=('wayland' 'gcc' 'fakeroot')
options=(!emptydirs)
source=("git+https://github.com/varmd/$_realname.git")
sha256sums=('SKIP')
provides=('wayward')

pkgver() {
	cd "$srcdir/$_realname"
	git tag | sort -r | head -n1 | cut -c2-
}

build() {
	cd "$srcdir/$_realname/source/source"
	sh "build.sh"
}

package() {
	cd "$srcdir/$_realname/source/source"
	sh "install.sh" "$pkgdir"
}
