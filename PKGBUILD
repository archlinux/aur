# Maintainer: Samet Kum <kumsamet@gmail.com>
pkgname=klustr-bin
pkgver=0.57.1
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
sha256sums=('a4d7d3211a84ef2ccfe10012f7d89648eda2c9f2f0d6a30f0e5800df34c69f7d'
            'b7bf5cd84bf1f5fcf987b660582882ad8bf28a7598241626193a3407b0000757'
            '1d89bab43b688bff3f9c27b26c9d84b6a049f02326deb514f77ae7410a11edd5'
            '7606e49d6ef759ae28de88a8f45132d2822393bc0620ffb5af06d259361e0472')

package() {
  install -Dm755 "${srcdir}/klustr" "${pkgdir}/usr/bin/klustr"
  install -Dm644 "${srcdir}/klustr.desktop" "${pkgdir}/usr/share/applications/klustr.desktop"
  install -Dm644 "${srcdir}/klustr.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/klustr.png"
  install -Dm644 "${srcdir}/klustr.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/klustr.svg"
}
