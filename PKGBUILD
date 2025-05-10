# Maintainer: f4iey <f4iey@f4iey.fr>
# Contributor: Mathieu Clabaut <mathieu "dot" clabaut "at" systerel.fr>

pkgname=atelierb-cssp-bin
pkgver=24.04
pkgrel=1
pkgdesc="The industrial tool to efficiently deploy the B Method (CSP Educational Version)"
arch=('x86_64')
url="https://www.atelierb.eu"
license=('custom')
depends=('libxrandr' 'libxcursor' 'libxinerama' 'fontconfig' 'libsm' 'icu72-bin' 'tk' 'python' 'cmake' 'qt5-multimedia' 'qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-declarative')
optdepends=('texlive-bin' 'firefox')
options=('!strip')
provides=('atelierb')
conflicts=('atelierb')
source=("https://www.atelierb.eu/wp-content/uploads/2024/09/${pkgname%-bin}-${pkgver}-debian-12.deb")
sha256sums=('SKIP')

package() {
  tar -xvf data.tar.* -C ${pkgdir}/
  install -Dm644 "$pkgdir/opt/${pkgname%-bin}-$pkgver/bin/AtelierB.desktop" "$pkgdir/usr/share/applications/AtelierB.desktop"
  # fix broken exec path
  sed -i "s/startAB/\/bin\/startAB/" "$pkgdir/usr/share/applications/AtelierB.desktop"
}
