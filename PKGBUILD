pkgname=archtoys-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Archtoys (precompiled binary)"
arch=("x86_64")
url="https://github.com/Mujtaba1i/Archtoys"
license=("MIT")
provides=("archtoys")
conflicts=("archtoys")
source=("archtoys-linux-x86_64.tar.gz::https://github.com/Mujtaba1i/Archtoys/releases/download/v${pkgver}/archtoys-linux-x86_64.tar.gz")
sha256sums=('8a118a099df5c7fd55a856fc526e94b23a8450d8d1b2526d5ade6cc026870fb0'
            '57caa2bef5a98bef17abeecb439e1ef7efab7826217b24ca1eaeac07c7720312'
            '5355e2b4f79c2bba7ac05a78dcc0e60f4f226f9222390204ef6a7a5294640f08'
            'e782f83cd1ba0f4179471251c56c15b7beae55285b3a6d55d2392fb81a4bc027'
            'f7a1502c230d2955db4da1f00d64bcaea47920cda4b3ae096503b696303cd6cf'
            '8f56c529e2a6829fd5a6428b3a84b4bac3c020d325ffc909370e859827539c78'
            '5e6ecfef3d0f756106acbb03cf406a0eb97baf811df8351339279bc725720027'
            'f1a61ee627c58a251b39994ebe796421dc8b9f4b370164d8251112f4d532aea9'
            'c0ef492619f05c719162685328088c7f234005ef4b9cd8b86f08b0d8cba42e57'
            'f3c1d903030433629585273f6ef97a724a6ad1cb64aa4cabc1d0bf0acfd0d8de'
            '8c3fbeb84a9ef2e6f3e2fbc3dade9b3691bd866eea78852a78f31463bb4ee8b5'
            '24fc53a20f0c092dbbd0a3233a75101147b3d3b8481df84bdce09baae183de8c')

package() {
  install -Dm755 "${srcdir}/archtoys" "${pkgdir}/usr/bin/archtoys"
  if [[ -f "${srcdir}/archtoys.desktop" ]]; then
    install -Dm644 "${srcdir}/archtoys.desktop" "${pkgdir}/usr/share/applications/archtoys.desktop"
  fi
  for size in 16 22 24 32 48 64 128 256 512 1024; do
    if [[ -f "${srcdir}/archtoys-${size}.png" ]]; then
      install -Dm644 "${srcdir}/archtoys-${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/archtoys.png"
    fi
  done
  if [[ -f "${srcdir}/archtoys.png" ]]; then
    install -Dm644 "${srcdir}/archtoys.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/archtoys.png"
  fi
}

source=(
  "archtoys-linux-x86_64.tar.gz::https://github.com/Mujtaba1i/Archtoys/releases/download/v${pkgver}/archtoys-linux-x86_64.tar.gz"
  "archtoys.desktop"
  "archtoys.png"
  "archtoys-16.png"
  "archtoys-22.png"
  "archtoys-24.png"
  "archtoys-32.png"
  "archtoys-48.png"
  "archtoys-64.png"
  "archtoys-128.png"
  "archtoys-256.png"
  "archtoys-512.png"
)
