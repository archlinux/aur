# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

pkgname=rvgl-launcher
pkgver=0.1.23.1030a3
pkgrel=1
pkgdesc='Files and mods manager for RVGL, the Re-Volt port.'
arch=('any')
url='https://rvgl.org/'
license=('custom')
depends=('python-wxpython'
         'python-requests'
         'python-packaging'
         'p7zip'
         'xdg-utils')
source=("https://rvgl.org/downloads/rvgl_launcher_linux.zip"
        'RVGL Launcher.desktop')
md5sums=('59817a9170121b4cf70e096e9afe07f4'
         'b644fd7487ddd7288328a3137c27c494')

pkgver() {
  printf "%s" "$(grep -woE '"0.*"' "$srcdir"/rv_launcher/version.py)" | tr -d '"'
}

package() {
  mkdir -p "$pkgdir"/opt/rvgl
  install -Dm755 "$srcdir"/appdirs.py "$pkgdir"/opt/rvgl/
  install -Dm755 "$srcdir"/rvgl_launcher.py "$pkgdir"/opt/rvgl/
  cp -r "$srcdir"/icons "$pkgdir"/opt/rvgl/
  cp -r "$srcdir"/repos "$pkgdir"/opt/rvgl/
  cp -r "$srcdir"/rv_launcher "$pkgdir"/opt/rvgl/
  install -Dm755 "$srcdir/RVGL Launcher.desktop" "$pkgdir/usr/share/applications/RVGL Launcher.desktop"
}
