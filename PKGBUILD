# Maintainer: Asterios Dimitriou <asterios at pci dot gr>

pkgname=git-sizer-bin
_pkgname=git-sizer
pkgver=1.4.0
pkgrel=1
pkgdesc="Compute various size metrics for a Git repository, flagging those that might cause problems"
url="https://github.com/github/git-sizer"
license=('MIT')
arch=('x86_64')
depends=('git')
conflicts=('git-sizer' 'git-sizer-git') # build with Go from sources

source=(git-sizer_${pkgver}.zip::https://github.com/github/git-sizer/releases/download/v${pkgver}/git-sizer-${pkgver}-linux-amd64.zip)
sha256sums=('7afdf6820e44417c861f8a32400b32e767b62275bae918cc1f46989293cbb1a6')
package() {
  cd "${srcdir}"
  install -Dm755 git-sizer "${pkgdir}"/usr/bin/git-sizer
#documentation
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${_pkgname}/README.md
#license
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
  install -Dm644 LICENSE-spf13-pflag "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE-spf13-pflag
}
