# Maintainer: Samet Kum <kumsamet@gmail.com>
pkgname=klustr-bin
pkgver=0.77.3
pkgrel=1
pkgdesc="Native Kubernetes desktop client — multi-context cluster management with live updates, logs, exec, port-forward, RBAC, CRDs, Helm, Argo CD and Gateway API support"
arch=('x86_64')
url="https://github.com/SametKUM/klustr"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('klustr')
conflicts=('klustr')
# Every local filename carries ${pkgver}: makepkg reuses any same-named file
# already in the build directory instead of re-downloading it, so an unversioned
# name serves a stale icon from an older release and fails the checksum.
source=("klustr-v${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/klustr-v${pkgver}-linux-amd64.tar.gz"
        "klustr-${pkgver}.desktop::${url}/raw/v${pkgver}/build/linux/klustr.desktop"
        "klustr-${pkgver}.png::${url}/raw/v${pkgver}/build/appicon.png"
        "klustr-${pkgver}.svg::${url}/raw/v${pkgver}/build/appicon.svg")
sha256sums=('dc7c3ffd4885f59a3ff29d4fcf5dfd669d469972986264be7de99620ce73bb7b'
            'b7bf5cd84bf1f5fcf987b660582882ad8bf28a7598241626193a3407b0000757'
            '1d89bab43b688bff3f9c27b26c9d84b6a049f02326deb514f77ae7410a11edd5'
            '7606e49d6ef759ae28de88a8f45132d2822393bc0620ffb5af06d259361e0472')

package() {
  install -Dm755 "${srcdir}/klustr" "${pkgdir}/usr/bin/klustr"
  install -Dm644 "${srcdir}/klustr-${pkgver}.desktop" "${pkgdir}/usr/share/applications/klustr.desktop"
  install -Dm644 "${srcdir}/klustr-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/klustr.png"
  install -Dm644 "${srcdir}/klustr-${pkgver}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/klustr.svg"
}
