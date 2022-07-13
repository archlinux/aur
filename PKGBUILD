# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=gnome-shell-extension-just-perfection-desktop
pkgver=20
_commit=3d1a61da574e9f47a5cf709465d135394ef0b7c8
pkgrel=1
pkgdesc='Just Perfection GNOME Shell Desktop'
arch=(any)
url=https://gitlab.gnome.org/jrahmatzadeh/just-perfection
license=('GPL3' 'CC0 1.0')
depends=(gnome-shell)
makedepends=(git unzip)
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=(SKIP)

build() {
	cd "$pkgname"
	bash scripts/build.sh
}

package() {
	cd "$pkgname"
	_extensiondir="/usr/share/gnome-shell/extensions/just-perfection-desktop@just-perfection"
	install -d "$pkgdir$_extensiondir"
	unzip just-perfection-desktop@just-perfection.shell-extension.zip -d "$pkgdir$_extensiondir"
}
