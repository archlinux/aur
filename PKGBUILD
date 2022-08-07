# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=gnome-shell-extension-just-perfection-desktop
pkgver=21
_commit=a9947bd8f8691a352a41b6534686ce48c4f6ece4
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
