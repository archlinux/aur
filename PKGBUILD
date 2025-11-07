# Maintainer: Jonah Barkley-Griggs <jbarkleygriggs@gmail.com>
pkgname=wayvy
pkgver=1.0.0
pkgrel=1
pkgdesc="Wayvy is a wallpaper switcher and theming manager for wayland written in rust."
arch=('x86_64')
url="https://codeberg.org/J_S_Barkely-Griggs/Wayvy"
license=('MPL-2.0')
groups=()
depends=('mpvpaper')
makedepends=('rust' 'cargo' 'make' 'git')
optdepends=('pywall: re-theming support'
            'walrs-extended: re-theming support with remote files'
            'walrs: re-theming support')
source=("wayvy::git+$url.git")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	make FEATURES="dbus theming"
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install install-config
}
