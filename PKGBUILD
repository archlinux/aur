# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributer: Shanto <shanto@hotmail.com>
# Contributer: Travis Lyons <travis.lyons@gmail.com>

pkgname=archipel-client
pkgver=0.6.0.beta
_appver=beta6
pkgrel=1
pkgdesc="A solution to manage and supervise virtual machines. (GUI)"
arch=("any")
url="http://archipelproject.org/"
license=('AGPL')
source=(
  "http://updates.archipelproject.org/archipel-gui-$_appver.zip"
  archipel.desktop
  archipel.svg
)
md5sums=('692a35e0880645fca37dc4f5627c7ed8'
         'cf9d5e382bfebd10b183fad369da1454'
         'a5fce1cc61847b4a5220a9b1ed4d4f3d')
install="$pkgname.install"

package() {
  install -d "$pkgdir/usr/share/archipel"
  cp -r "$srcdir/archipel-gui-$_appver"/* "$pkgdir/usr/share/archipel"
  find "$pkgdir/usr/share/archipel" -type f -exec chmod 644 {} \;
  find "$pkgdir/usr/share/archipel" -type d -exec chmod 755 {} \;

  install -D -m 644 "$srcdir/archipel.desktop" "$pkgdir/usr/share/applications/archipel.desktop"
  install -D -m 644 "$srcdir/archipel.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/archipel.svg"
}

# vim:set ts=2 sw=2 et:
