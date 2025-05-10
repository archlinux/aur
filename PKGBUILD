# Maintainer: f4iey <f4iey@f4iey.fr>
# Contributor: Mathieu Clabaut <mathieu "dot" clabaut "at" systerel.fr>

pkgname=atelierb-bin
pkgver=24.04.2
pkgrel=1
pkgdesc="The industrial tool to efficiently deploy the B Method (precompiled binary)"
arch=('x86_64')
url="https://www.atelierb.eu"
license=('custom')
depends=('libxrandr' 'libxcursor' 'libxinerama' 'fontconfig' 'libsm' 'icu72-bin')
optdepends=('texlive-bin' 'firefox')
provides=('atelierb')
conflicts=('atelierb')
source=("https://www.atelierb.eu/wp-content/uploads/2024/10/atelierb-free-${pkgver}-debian12.deb")
sha256sums=('SKIP')

package() {
  bsdtar -xvf data.tar.* -C ${pkgdir}/
  install -Dm644 "$pkgdir/opt/atelierb-free-$pkgver/bin/AtelierB.desktop" "$pkgdir/usr/share/applications/AtelierB.desktop"
  # fix broken exec path
  sed -i "s/startAB/\/bin\/startAB/" "$pkgdir/usr/share/applications/AtelierB.desktop"
}
