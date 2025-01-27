# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=dlvhdr
_pkgname=diffnav
pkgname=${_pkgname}-bin
pkgver=0.3.0
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
sha256sums_x86_64=('ee6947654afffac758d7bf1e82999f8ececa25bbfa2ff5cb959f922d4c5c31f0')
sha256sums_i686=('530e8e5db982abb65ee383222c340d7f67c8e1616cfb79f21425229734e8881d')
sha256sums_aarch64=('e3108d77a513953e74ba886a26f564fee69359123843aa4d81f3eff08e4ccea7')

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
