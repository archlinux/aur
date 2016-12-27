# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: lybin
 
pkgname=geckodriver-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="Proxy for using W3C WebDriver-compatible clients to interact with Gecko-based browsers."
arch=('i686' 'x86_64')
url="https://github.com/mozilla/geckodriver"
license=('MPL')
optdepends=('firefox')
 
if [ "$CARCH" = "i686" ]; then
    _arch='linux32'
    md5sums=('e116d4339739044d69461790f1ee244d')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='linux64'
    md5sums=('07fc72ee51fe79ed2906f1b79f124c1c')
fi
 
source=("${pkgname}_${pkgver}_${_arch}.tar.gz::https://github.com/mozilla/geckodriver/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-${_arch}.tar.gz")
 
package() {
  mkdir -p "${pkgdir}/usr/bin/"
  install -D -m 755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/"
}
