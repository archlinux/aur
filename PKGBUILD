# Maintainer: Gabriel B. Casella <gbc921@gmail.com>
# Maintainer: Cassio Batista <cassio.batista.13@gmail.com>
# Contributor: Rafael Beraldo <rafaelluisberaldo@gmail.com>

pkgname=abntex2
pkgver=1.9.7
pkgrel=4
pkgdesc="a LaTeX class for writing ABNT-compliant documents"
arch=('i686' 'x86_64')
url="https://github.com/abntex/abntex2"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra')
source=("${url}/archive/refs/tags/2018-11-24-v${pkgver}-ctan.tar.gz")
conflicts=('texlive-publishers')
sha1sums=('41f0d0900de00177937a343fe67a9757a5e954e1')

install=abntex2.install

package() {
  install -dm755 "${pkgdir}/usr/share/texmf-dist/"

  srcdir=("${pkgname}-2018-11-24-v${pkgver}-ctan")
  for subdir in tex doc bibtex ; do
    cp -r "${srcdir}/${subdir}" "${pkgdir}/usr/share/texmf-dist/"
  done
}

# vim:set ts=2 sw=2 et:
