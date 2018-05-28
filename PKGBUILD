# Maintainer: robertfoster
# Contributor: Eschwartz <eschwartz93@gmail.com>

pkgname=winetricks-git
pkgver=20180513.r15.g3733382
pkgrel=1
pkgdesc='Script to install various redistributable runtime libraries in Wine.'
url='http://wiki.winehq.org/winetricks'
license=('LGPL')
arch=('any')
depends=('wine' 'cabextract' 'unzip' 'xorg-xmessage')
makedepends=('git')
optdepends=('zenity: For the GTK3 GUI.'
	'kdialog: For the KDE GUI (less capable).'
)
conflicts=('winetricks' 'bin32-winetricks')
provides=('winetricks')
source=("$pkgname::git+https://github.com/Winetricks/winetricks.git")

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -r 's/-([0-9]+)-/.r\1./'
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}

md5sums=('SKIP')
