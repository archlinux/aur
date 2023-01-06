# Maintainer: Funami
pkgname=jetbrains-fleet
pkgver=1.13.92
pkgrel=1
pkgdesc="Next-generation IDE by JetBrains"
arch=('x86_64')
url="https://www.jetbrains.com/fleet/"
license=('custom:jetbrains')
source=("https://download-cdn.jetbrains.com/fleet/installers/linux_x64/Fleet-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        'LICENSE')
sha256sums=('effda96729ad7686177f2370e077ab258ac4886fab4132475dca44787bdd3c12'
            'af62a597c595edc5b4a8ea3f80ab0a18ea953bfc2d4feaf30e41c6e0dd23d426'
            '823bce80facc46ff161e0a800bdda27452e8beeb396bb163af560e9e6c796c75')

package() {
  cd Fleet
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -dr --no-preserve='ownership' -t "${pkgdir}/opt/${pkgname}" ./*
  install -Dm644 ./lib/Fleet.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../"${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/bin/Fleet" "${pkgdir}/usr/bin/${pkgname}"
}
