# Maintainer: Thomas Roos <thomas a thomasroos d nl>
# Maintainer: Jaan Toots <jaantoots@gmail.com>
# Contributor: Oliver Mader <b52@reaktor42.de>

pkgname=mitk-bin
pkgver=2025.12.2
pkgrel=2
pkgdesc='Medical Imaging Interaction Toolkit (MITK) is a free open-source software system for development of interactive medical image processing software.'
arch=('x86_64')
url='https://mitk.org'
license=('BSD')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/MITK/MITK/releases/download/v${pkgver}/MITK-v${pkgver}-ubuntu-22.04-${arch}.tar.gz"
        "LICENSE"
        "mitk-workbench"
        "mitk-workbench.desktop"
        "mitk.ico")
sha256sums=('5e72c6478c45c54d59428c526ef660fad76a9213a509084a6115c86aa19e3462'
            'e738b539907754ee44cf101687df6b9e31ed7176a11dea077eadfd2f280cbb68'
            '67ed9f62f45cf5c2bc416507502e6a5bb9f26ef199186a3c4e68cf8a2da86f6f'
            '853407ed4d3b6f09a01d1c3aef3d7741bfecef991cf956356dc4ca4e777a9faf'
            '5d43fd48ea00d1e50c2181e2f2d785b4cf4e290e96da639cb887c0b20f2cec81')

options=(!strip)

package() {
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/MITK-v${pkgver}-ubuntu-22.04-${arch}/." "${pkgdir}/opt/${pkgname}/"
  install -Dm755 "${srcdir}/mitk-workbench" "${pkgdir}/usr/bin/mitk-workbench"
  install -Dm644 "${srcdir}/mitk-workbench.desktop" "${pkgdir}/usr/share/applications/mitk-workbench.desktop"
  install -Dm644 "${srcdir}/mitk.ico" "${pkgdir}/usr/share/pixmaps/mitk.ico"
}
