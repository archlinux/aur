# Maintainer: Victor Benito Garcia Rocha <victorbenitogr@gmail.com>
pkgname=ganbaru-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Local, privacy-first productivity app for reducing procrastination and burnout"
arch=('x86_64')
url="https://github.com/opengrimoire/ganbaru"
license=('AGPL-3.0-only')
depends=(
  'alsa-lib'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'webkit2gtk-4.1'
)
makedepends=('libarchive')
provides=('ganbaru')
conflicts=('ganbaru')
options=('!strip' '!debug')
source_x86_64=("ganbaru_${pkgver}_amd64.deb::https://github.com/opengrimoire/ganbaru/releases/download/app-v${pkgver}/ganbaru_${pkgver}_amd64.deb")
sha256sums_x86_64=('be40431389f3d688a1aba35e6b6b6f77cd04b984be116ac5496c8cec192449d2')
noextract=("ganbaru_${pkgver}_amd64.deb")

prepare() {
  bsdtar -xf "ganbaru_${pkgver}_amd64.deb"
}

package() {
  bsdtar -xf data.tar.* -C "$pkgdir"

  rm -rf "$pkgdir/usr/lib/ganbaru/package-repo"
  rmdir "$pkgdir/usr/lib/ganbaru" 2>/dev/null || true
  rmdir "$pkgdir/usr/lib" 2>/dev/null || true
}
