# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

_basename="deprecation-detector"
_tag="0.1.0-alpha2"
pkgname="php-${_basename}"
pkgver=${_tag/\-/\.}
pkgrel=2
pkgdesc="static code analyzer for your project's source code to find usages of deprecated methods, classes and interfaces"
url="https://github.com/sensiolabs-de/deprecation-detector"
license="MIT"
arch=("any")
depends=("php>=5.3.9")
source=(
    "deprecation-detector-${_tag}.phar::https://github.com/sensiolabs-de/deprecation-detector/releases/download/${_tag}/deprecation-detector.phar"
    "https://raw.github.com/sensiolabs-de/deprecation-detector/${_tag}/LICENSE"
)
sha256sums=(
    "f6943b698f30eaeb37a7903801d84454a404a6fe4cb4493e936a14dc8c7960db"
    "SKIP"
)

package() {
  cd "${srcdir}/"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "deprecation-detector-${_tag}.phar" "${pkgdir}/usr/share/webapps/bin/${_basename}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_basename}.phar" "${pkgdir}/usr/bin/${_basename}"
}
