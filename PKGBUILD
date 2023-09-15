# Maintainer: Arsenii Liubogashchinskii <tarsenicum at gmail dot com>

pkgname=rustrover-rustless
pkgver=232.9921.46
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
b2sums=('51c520e5f08d179ebf394ca7dee964c51e277e2a048b080879cb73d7f2e549a951fbe70d14cab2bce75d0ab6acb55010eca9772b962164e7c64f9a3b407ce020'
        'c58f94e059f4166e33961c86aeb9bb0f04e7c29ba39b667b55152b121092c50ccb00f7656987fec3125a8ac79df4abc54acbfe4149efe7c9b72b813fb30491c1'
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
