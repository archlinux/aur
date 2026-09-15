# Maintainer: HorneroOS <horneroos@example.com>
pkgname=hornero-greeter-media-base
pkgver=1.0.0
pkgrel=1
pkgdesc='Base Argentina video pack for the HorneroOS SDDM greeter (offline H.264)'
arch=('any')
url='https://github.com/HorneroOS/greeter'
license=('CC-BY-4.0' 'CC-BY-3.0' 'CC-BY-SA-3.0' 'CC-BY-SA-4.0')
# Built by scripts/media/package.py and attached to the greeter GitHub
# Release below (never downloaded at install, never built from source).
_media_tag=v0.1.0-preview
source=("hornero-greeter-media-base-${pkgver}.tar.zst::https://github.com/HorneroOS/greeter/releases/download/${_media_tag}/hornero-greeter-media-base-${pkgver}.tar.zst")
sha256sums=('fac8cbecef0b8225bb80c65eb68b64d5a84bb57555b0f37ae42cda33d452a057')

package() {
  install -d "$pkgdir/usr/share/hornero/greeter/media/base"
  tar --zstd -xf "$srcdir/hornero-greeter-media-base-${pkgver}.tar.zst" \
    -C "$pkgdir/usr/share/hornero/greeter/media" --strip-components=2 hornero-greeter-media-base/base
  # sddm-owned readable: dirs 0755, files 0644.
  find "$pkgdir" -type d -exec chmod 0755 {} +
  find "$pkgdir" -type f -exec chmod 0644 {} +
}
