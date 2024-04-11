# Maintainer: libele <libele@disroot.org>

pkgname=vilearn
pkgver=1.1
_commit=00ee4a43
pkgrel=4
pkgdesc="An interactive vi tutorial"
arch=('any')
url="https://git.sr.ht/~libele/vilearn"
license=('custom:Copyright')
makedepends=('bmake')
optdepends=('vi: the original ex/vi text editor')
source=(${pkgname}-${pkgver}.tar.gz::"https://git.sr.ht/~libele/vilearn/archive/${_commit}.tar.gz")
sha256sums=('4e234c5039eea23c479158a96f822921db4dfc6aa3093a8f8889b94cdf04422a')

package() {
  cd "${pkgname}-${_commit}"

  bmake DESTDIR=${pkgdir} BINDIR=/usr/bin MANDIR=/usr/share/man TUTORIALS=/usr/share/vilearn install
  install -Dm644 README.md "${pkgdir}"/usr/share/vilearn/README
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/vilearn/LICENSE
}
