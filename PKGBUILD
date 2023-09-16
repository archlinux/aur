# Maintainer: Arsenii Liubogashchinskii <tarsenicum at gmail dot com>

pkgname=rustrover-rustless
pkgver=232.9921.62
pkgrel=1
pkgdesc='JetBrains IDE for Rust Developers (package without rust-src dependencies)'
arch=('any')
url='https://www.jetbrains.com/rust/'
license=('custom:jetbrains')
options=('!strip')
basename=rustrover
source=("https://download.jetbrains.com/${basename}/RustRover-${pkgver}.tar.gz"
        jetbrains-rustrover.desktop
        LICENSE)
b2sums=('635e957d8fd859b29cc507199865f27c0a4611bee283fc6ae4264889af4b54e70dbe8b80b2347c56797fb9e6c3b9c03f5d7e6214fb646d930fdd39b9eb40202c'
        'aa9f87b2f96322886d5ff01f581943807c6e96c7e3d5b1e9f797073b24b6adf28fdc3d21fa3eb5f4e978ab8ba63dabc31615bc984c34050c8dc5d7a13e631f8a'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package() {
  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/RustRover-${pkgver}/ "${pkgdir}"/opt/${pkgname}

  ln -s /opt/${pkgname}/bin/${basename}.sh "${pkgdir}"/usr/bin/${pkgname}
  install -m644 "${srcdir}"/jetbrains-${basename}.desktop "${pkgdir}"/usr/share/applications/jetbrains-${pkgname}.desktop
  install -m644 "${pkgdir}"/opt/${pkgname}/bin/${basename}.svg "${pkgdir}"/usr/share/pixmaps/${pkgname}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
