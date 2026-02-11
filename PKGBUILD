# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dlvhdr
_pkgname=diffnav
pkgname=${_pkgname}-bin
pkgver=0.9.0
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
            '80d6f8d1cc504800e65bc4ac55b576d4826f7b22c5ce95b76f40ba85a717741b')
sha256sums_x86_64=('3726d91649bf7c5cec55d2a65c9d0afee36f5708d34fd9c44eb1c349867f7f71')
sha256sums_i686=('c27c6319bde151cd988f60c57a2d7d33ef02d64a30f051df1e27ee5f25a5551e')
sha256sums_aarch64=('0f5dcade03943420c67e9211500949a416a685eafc6361592712f9a701f97e96')

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}" "${pkgdir}/usr/share/doc/$pkgname/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
