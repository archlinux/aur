# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dlvhdr
_pkgname=diffnav
pkgname=${_pkgname}-bin
pkgver=0.10.0
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
            'eabba3fa03736370e192f60a29ba74e5b886ecd61700561b7c7629d7255e63b6')
sha256sums_x86_64=('d0f08652d0ccc0d2ebf54c222333ddb0d57eb96ce4f7fe574ab60d53df90286a')
sha256sums_i686=('fc115c42f4b1f7150689c4bbc1bbcb6c0f09a19739f097b9ec17a27efc7a8676')
sha256sums_aarch64=('adbdfdb1b9a7606d6b8d59a990d7f880a7f362c1882bea8bcfc348bf23409bbb')

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}" "${pkgdir}/usr/share/doc/$pkgname/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
