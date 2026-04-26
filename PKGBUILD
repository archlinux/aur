# Maintainer: Xavier Góngora <ixbalanque at protonmail dot ch>

_appname=mine
_refname=coalton
pkgname=${_appname}-core-bin
pkgver=0.1.2
pkgrel=1
epoch=0
pkgdesc="A full-featured, TUI-based IDE for Coalton and Common Lisp"
arch=('x86_64')
url="https://${_refname}-lang.github.io/${_appname}"
_url="https://github.com/${_refname}-lang/${_refname}"
_rawurl="https://raw.githubusercontent.com/${_refname}-lang/${_refname}/refs/heads/main"
license=('MIT')
depends=('glibc')
provides=("${_appname}")
# Strip needs to be disabled because it removes the SBCL core from the image
options=('!strip')
source=("${_url}/releases/download/${_appname}-v${pkgver}/${_appname}-core-linux-${arch[0]}-v${pkgver}.zip"
  "${_rawurl}/LICENSE.txt")
sha256sums=('6569a304e153ddb2ba8c740826235235501ed5d2db6fff748a5efff28825a457'
            'cb5aedb296c5246d1f22e9099f925a65146f9f0d6b4eebba97fd27a6cdbbab2d')

package() {
  install -Dm755 "${_appname}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

  install -Dm644 "${_appname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
