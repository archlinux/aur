# Maintainer: Adriaan Zonnenberg <amz@adriaan.xyz>

pkgname=gnome-shell-extension-redshift-native-git
pkgver=28.9768ef4
_gitname=gnome-shell-extension-redshift
_uuid='redshift@benjamin.sipsolutions.net'
pkgrel=1
pkgdesc='A native redshift implementation for GNOME'
url='https://github.com/benzea/gnome-shell-extension-redshift'
arch=('any')
license=('GPL2')
depends=('gnome-shell>=3.22' 'gnome-settings-daemon-redshift')
makedepends=('git' 'zip' 'unzip')
source=('git://github.com/benzea/gnome-shell-extension-redshift.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$_gitname"
  ./make-zip.sh
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  unzip "$_uuid.zip" -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
