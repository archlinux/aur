# Maintainer: Spiros Georgaras <sng#hellug.gr>

pkgname=i3-keylist
pkgver=1.0
pkgrel=1
pkgdesc="simple script to display i3 key list"
arch=('any')
url="https://github.com/s-n-g/i3-keylist.git"
license=('GPL')
depends=('python-gobject')
source=($pkgname::git+https://github.com/s-n-g/i3-keylist.git)
sha256sums=('SKIP')

package() {
  cd $pkgname
  install -Dm755 i3-keylist-view.py $pkgdir/usr/bin/i3-keylist
  cat <<END


i3-keylist is ready to be installed!

To use it just add this (or similar) to your ~/.config/i3/config

    bindsym \$mod+slash exec --no-startup-id i3-keylist
    for_window [title="i3 Key List"] floating enable border pixel 1

This will make Mod+/ (Super+/) to display the window
Enjoy!


END
}
