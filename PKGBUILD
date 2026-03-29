# Maintainer: RobinJBK <2815968613@qq.com>

pkgname=fleet-ide
pkgver=1.48.261
pkgrel=1
arch=('x86_64')
pkgdesc="More Than a Code Editor."
url="https://www.jetbrains.com/fleet/"
license=('custom:commercial')
options=(!strip)
conflicts=(fleet-ide-jre)
provides=(fleet-ide-jre)
source=("fleet-ide.desktop")
source_x86_64=("https://download-cdn.jetbrains.com/fleet/installers/Fleet-$pkgver.tar.gz")
sha256sums=('8d5851c81faee37e3b59120938dc0c442da95629ec45ca3cd753081a04e296fe')
sha256sums_x86_64=('34b46ec17bdff414eae97d31cd46ea7e9d0b4a98e66cb98c4c64b17579060f4a')

package_fleet-ide() {
  depends=('giflib' 'libxtst' 'libxrender')
  optdepends=(
    'libdbusmenu-glib: For global menu support'
  )
  cd "$srcdir"
  install -d -m755 "$pkgdir"/{opt/$pkgname,usr/bin}
  mv Fleet/* "$pkgdir"/opt/$pkgbase
  chmod 755 "$pkgdir"/opt/$pkgbase/*
  ln -s /opt/$pkgname/bin/Fleet "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "$srcdir"/fleet-ide.desktop "$pkgdir"/usr/share/applications/fleet-ide.desktop
}

# vim:set ts=2 sw=2 et:
