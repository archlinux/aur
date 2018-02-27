# Maintainer: robertfoster
# Contributor: Eschwartz <eschwartz93@gmail.com>

pkgname=winetricks-git
pkgver=20180217.r9.g807ed1f
pkgrel=1
pkgdesc='Script to install various redistributable runtime libraries in Wine.'
url='http://wiki.winehq.org/winetricks'
license=('LGPL')
arch=('any')
depends=('wine' 'curl' 'cabextract' 'unrar' 'unzip' 'p7zip')
makedepends=('git')
optdepends=('zenity: For the GTK3 GUI.'
	'kdebase-kdialog: For the KDE GUI (less capable).'
	'sudo: For automatically mounting ISO images.'
	'xdg-utils: For opening manual download pages.'
'perl: For installing Steam.')
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
