# Maintainer: hamki <hamki.do2000@gmail.com>

pkgname=emacs-org-roam
pkgver=1.2.4
pkgrel=2
pkgdesc="Org-roam is a plain-text knowledge management system."
url="https://github.com/org-roam/org-roam"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-org-mode' 'emacs-f' 'emacs-emacsql-sqlite3')
makedepends=()
provides=()
conflicts=()
source=("https://github.com/org-roam/org-roam/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de5bd76afdb516b41eff21f2f4746a35414b7cf594bd2945b1efc4aa4bb45bbb')

build() {
  cd "${srcdir}/org-roam-${pkgver}"
  emacs -Q -batch -L . -f batch-byte-compile *.el
 }

package() {
  cd "${srcdir}/org-roam-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/org-roam"
  install -m644 org-roam* "${pkgdir}/usr/share/emacs/site-lisp/org-roam/"
}
