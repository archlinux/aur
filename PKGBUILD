# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
pkgname=jbxkb
pkgver=0.7
pkgrel=1
pkgdesc="A pygtk keyboard layout switcher tray applet (inspired by gxkb) for JustBrowsing"
arch=('any')
url="https://github.com/justbrowsing/jbxkb"
license=('GPL3')
depends=('python2' 'pygtk' 'procps-ng' 'xorg-setxkbmap' 'xkb-switch-git')
optdepends=('ibus-lite: Special input methods without python3 dependency' 
			'ibus-m17n: Variety pack of input methods' 
			'ibus-pinyin: Popular Chinese input method'
			'ibus-skk: Popular Japanese input method')
groups=("justbrowsing")
source=("https://github.com/justbrowsing/jbxkb/archive/master.zip")
md5sums=('4131ce5ac97ab0e802cdf20a15a3911a')
 
package() {
  cd "$srcdir/${pkgname}-master"

  # Install flag icons
  install -d "$pkgdir/usr/share/jbxkb"
  cp -a usr/share/jbxkb/*png "$pkgdir/usr/share/jbxkb"

  # Desktop launcher
  install -Dm644 "jbxkb.png" "$pkgdir/usr/share/pixmaps/jbxkb.png"
  install -Dm644 "jbxkb.desktop" "$pkgdir/usr/share/applications/jbxkb.desktop"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/jbxkb/LICENSE

  # Executable
  install -Dm555 jbxkb  "$pkgdir/usr/bin/jbxkb"
  chmod +x "$pkgdir/usr/bin/jbxkb"
}


