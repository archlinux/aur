# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=dlvhdr
_pkgname=diffnav
pkgname=${_pkgname}-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="A git diff pager based on delta but with a file tree, à la Github."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('glibc' 'git-delta')
makedepends=('tar')
optdepends=('ttf-meslo-nerd: icon support in the terminal' 'otf-commit-mono-nerd: icon support in the terminal')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.txt"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums=('de036f76c1af8b3d425bbaa2e06863e0cc9b909ccad8aa671cb13647c3872f4b'
            '088531a3b4095ad89f7d1ef70ab4493abc20208a39f69d6e66ee9e5b19f6f7d2')
sha256sums_x86_64=('37a286faec53bf1c29192a8e59c6da0f6a5b96d987fb8529f203d5d25e7472b4')
sha256sums_i686=('cabcd21dcd680f3dc0a771f4751e7bca53dd92e16654fe493eefb5eccf5b3f61')
sha256sums_aarch64=('341de4f197d2a53e008cb681be8371b53fe5f3b043dfc0b84571d760d1621bd4')

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
