# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgname=qq
pkgname=${_pkgname}-bin
_pkgver=0.2.2-r
pkgver=${_pkgver%-r}
pkgrel=2
pkgdesc="jq inspired interoperable config format transcoder with interactive querying; JSON/YAML/TOML/XML/... support; MIT license - git development version"
arch=('x86_64' 'aarch64')
url="https://github.com/JFryy/${_pkgname}/"
_urlraw="https://raw.githubusercontent.com/JFryy/${_pkgname}/v${_pkgver}"
license=('MIT')
makedepends=('tar')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("LICENSE_${pkgver}::${_urlraw}/LICENSE"
        "README_${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}_x86_64.tar.gz::${url}/releases/download/v${_pkgver}/${_pkgname}-v${_pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}_aarch64.tar.gz::${url}/releases/download/v${_pkgver}/${_pkgname}-v${_pkgver}-linux-arm64.tar.gz")
md5sums=('2334c8619b392ef67df716363660a45d'
         '8edeb413db50ae4ea56dd609129b2c8d')
md5sums_x86_64=('01b62674bd630734dc7bce6968e5c2e7')
md5sums_aarch64=('9cb17dcd468ea7512933b022b70758f2')

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
