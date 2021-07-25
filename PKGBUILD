# Maintainer: Your Name <youremail@domain.com>
pkgname=avvie-git
_pkgname=avvie
pkgver=1.0.beta1.r63.gdda3f95
pkgrel=1
pkgdesc="A GTK app for quick image cropping"
arch=('x86_64')
url="https://github.com/Taiko2k/avvie"
license=('GPL3')
depends=('python3' 'python-gobject' 'python-pillow' 'python-piexif')
makedepends=(git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
  #chmod +x "${_pkgname}/main.py"
#}

package() {
  #install -Dm755 "$_pkgname/main.py" "$pkgdir/usr/bin/$_pkgname/main.py"
  install -Dm755 "$_pkgname/main.py" "$pkgdir/usr/bin/main.py"
  #install -Dm755 "$_pkgname/main.py" "${pkgdir}/opt/${_pkgname}/main.py"
  install -Dm644 "$_pkgname/com.github.taiko2k.avvie.appdata.xml" "$pkgdir/usr/share/metainfo/com.github.taiko2k.avvie.appdata.xml"
  install -Dm644 "$_pkgname/com.github.taiko2k.avvie.desktop" "$pkgdir/usr/share/applications/com.github.taiko2k.avvie.desktop"
  install -Dm644 "$_pkgname/com.github.taiko2k.avvie.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.taiko2k.avvie.svg"
  install -Dm644 "$_pkgname/com.github.taiko2k.avvie-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/com.github.taiko2k.avvie-symbolic.svg"
  install -Dm644 "$_pkgname/icon128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.github.taiko2k.avvie.png"
  install -Dm644 "$_pkgname/icon256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.github.taiko2k.avvie.png"
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  #install -dm755 "${pkgdir}/usr/bin"
  #ln -s "/opt/${_pkgname}/main.py" "${pkgdir}/usr/bin/${_pkgname}"
  #gtk-update-icon-cache /usr/share/icons/hicolor
}
