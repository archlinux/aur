# Maintainer: Victor Benito Garcia Rocha <victorbenitogr@gmail.com>
pkgname=ganbaru-ai-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Local, privacy-first productivity app for reducing procrastination and burnout"
arch=('x86_64')
url="https://github.com/opengrimoire/ganbaru-ai"
license=('AGPL-3.0-only')
depends=(
  'alsa-lib'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'webkit2gtk-4.1'
)
makedepends=('libarchive')
provides=('ganbaru-ai')
conflicts=('ganbaru-ai')
options=('!strip' '!debug')
source_x86_64=("ganbaru-ai_${pkgver}_amd64.deb::https://github.com/opengrimoire/ganbaru-ai/releases/download/app-v${pkgver}/ganbaru-ai_${pkgver}_amd64.deb")
sha256sums_x86_64=('7ff0264b9b1821f71bb982172a135ec2280318e895d020bb04365d5ef28f2916')
noextract=("ganbaru-ai_${pkgver}_amd64.deb")

prepare() {
  bsdtar -xf "ganbaru-ai_${pkgver}_amd64.deb"
}

package() {
  bsdtar -xf data.tar.* -C "$pkgdir"

  rm -rf "$pkgdir/usr/lib/ganbaru-ai/package-repo"
  rmdir "$pkgdir/usr/lib/ganbaru-ai" 2>/dev/null || true
  rmdir "$pkgdir/usr/lib" 2>/dev/null || true
}
