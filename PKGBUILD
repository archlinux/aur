# Maintainer: robertfoster
# Contributor: Eschwartz <eschwartz93@gmail.com>

pkgname=winetricks-git
pkgver=20240105.r47.g72b934e1
pkgrel=1
pkgdesc='Script to install various redistributable runtime libraries in Wine.'
url='http://wiki.winehq.org/winetricks'
license=('LGPL-2.1-or-later')
arch=('any')
depends=('wine' 'cabextract' 'unzip')
makedepends=('git')
optdepends=('zenity: For the GTK3 GUI.'
  'kdialog: For the KDE GUI (less capable).'
)
conflicts=('winetricks' 'bin32-winetricks')
provides=('winetricks')
source=("$pkgname::git+https://github.com/Winetricks/winetricks.git")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/-([0-9]+)-/.r\1./' | sed -r 's/-test//'
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

sha256sums=('SKIP')
