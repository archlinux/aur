# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Benjamin Chrétien <chretien at lirmm dot fr>
pkgname=git-latexdiff
pkgver=1.2.0
pkgrel=3
pkgdesc="Simple but very convenient wrapper around Git and latexdiff"
arch=('any')
url="https://gitlab.com/git-latexdiff/git-latexdiff"
license=('GPL')
makedepends=('asciidoc')
depends=('texlive-core' 'texlive-bin' 'git')
source=("v${pkgver}.tar.gz"::"https://gitlab.com/${pkgname}/${pkgname}/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('76b19b623749025bde0617776237dbd6763a21d19cd6b6b353765846dac766ec')

build() {
  cd "${srcdir}"/git-latexdiff-v"${pkgver}"-*

  make git-latexdiff.1
}

package() {
  cd "${srcdir}"/git-latexdiff-v"${pkgver}"-*

  install -m 755 -D git-latexdiff ${pkgdir}/usr/bin/git-latexdiff
  install -m 644 -D git-latexdiff.1 ${pkgdir}/usr/share/man/man1/git-latexdiff.1
}
# vim:set ts=2 sw=2 et:
