# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=zap-desktop-bin
pkgver=0.1.1_beta
# Actual version used by project
_ver=${pkgver//_/-}
pkgrel=1
pkgdesc="Lightning wallet focused on user experience and ease of use"
arch=('x86_64')
url="https://github.com/LN-Zap/zap-desktop"
license=('MIT')
source_x86_64=("https://github.com/LN-Zap/zap-desktop/releases/download/v${_ver}/zap-linux-release-v${_ver}.zip")
md5sums_x86_64=('74462a912ac08ab6e1a8405ff0f32803')

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/applications,/usr/share/pixmaps,/usr/share/licenses/$pkgname}

  # Install all .deb files into /opt.
  mkdir "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/zap-linux-release-v${_ver}/linux-unpacked/". "$pkgdir/opt/$pkgname"

  # Symlink executable
  ln -s "/opt/$pkgname/zap-desktop" "$pkgdir/usr/bin/zap-desktop"

  # Symlink licenses 
  ln -s "/opt/$pkgname/LICENSES.electron.txt" "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/opt/$pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname"

  # Symlink desktop icon
  #ln -s "/opt/zap-desktop/zap-desktop.desktop" "${pkgdir}/usr/share/applications/zap-desktop.desktop"
  #ln -s "/opt/zap-desktop/zap-desktop.png" "${pkgdir}/usr/share/pixmaps/zap-desktop.png"
}
