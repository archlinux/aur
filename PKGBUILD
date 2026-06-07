# Maintainer: Victor Benito Garcia Rocha <victorbenitogr@gmail.com>
pkgname=ganbaru-ai-bin
pkgver=0.1.4
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
sha256sums_x86_64=('8a9ca8968d6270eb1a9a24542fe90d6fea1d8def1eb28f48fb5931a7aab7ac44')
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
