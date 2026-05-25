# Maintainer: Samet Kum <kumsamet@gmail.com>
pkgname=klustr-bin
pkgver=0.32.0
pkgrel=1
pkgdesc="Native Kubernetes desktop client — multi-context cluster management with live updates, logs, exec, port-forward, RBAC, CRDs, Helm, Argo CD and Gateway API support"
arch=('x86_64')
url="https://github.com/SametKUM/klustr"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('klustr')
conflicts=('klustr')
source=("klustr-v${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/klustr-v${pkgver}-linux-amd64.tar.gz"
        "klustr.desktop::${url}/raw/v${pkgver}/build/linux/klustr.desktop"
        "klustr.png::${url}/raw/v${pkgver}/build/appicon.png"
        "klustr.svg::${url}/raw/v${pkgver}/build/appicon.svg")
sha256sums=('f6d65079b2d1a399e560a49a877991f031d44e7f69d5044f2ea1ec7d0d464dd8'
            'b7bf5cd84bf1f5fcf987b660582882ad8bf28a7598241626193a3407b0000757'
            '1d89bab43b688bff3f9c27b26c9d84b6a049f02326deb514f77ae7410a11edd5'
            '1be6b010cada3249d940ef4dc25ce0beb73c48fb893a2e7652c37a16776a0148')

package() {
  install -Dm755 "${srcdir}/klustr" "${pkgdir}/usr/bin/klustr"
  install -Dm644 "${srcdir}/klustr.desktop" "${pkgdir}/usr/share/applications/klustr.desktop"
  install -Dm644 "${srcdir}/klustr.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/klustr.png"
  install -Dm644 "${srcdir}/klustr.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/klustr.svg"
}
