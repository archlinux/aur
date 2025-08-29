# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=dlvhdr
_pkgname=diffnav
pkgname=${_pkgname}-bin
pkgver=0.3.1
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
            '10701e9a8b30c1c5c801e24f60d46ee8e94b91f0526ff544cf39a28449de20e0')
sha256sums_x86_64=('b2e515a2b2d3d74a492f510fee2a0d3561c3ad73236b68c1c72f3caa697c640c')
sha256sums_i686=('de8d7ff87cfa4e75fbebb4736f9f6d760006f860cf21c7ea72a486647ed98222')
sha256sums_aarch64=('2473af93f063e4f8c45bd2337ff51fb95587eb8cd070ba08edc419d50979ebb9')

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
