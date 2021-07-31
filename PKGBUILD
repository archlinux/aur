# Maintainer: hamki <hamki.do2000@gmail.com>
pkgname=emacs-org-roam
pkgver=2.0.0
pkgrel=1
pkgdesc="Org-roam is a plain-text knowledge management system."
url="https://github.com/org-roam/org-roam"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-org-mode' 'emacs-f'  'emacs-emacsql-sqlite3')
makedepends=('emacs-magit')
provides=()
conflicts=()
source=("https://github.com/org-roam/org-roam/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('916a8e3b7bd0ff13ed276622d8d48bc44596e1a73380eaa7c6fde51b87f2909d')

build() {
  cd "${srcdir}/org-roam-${pkgver}"
  emacs -batch -L . -f batch-byte-compile *.el
 }

package() {
  cd "${srcdir}/org-roam-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/org-roam"
  install -m644 org-roam* "${pkgdir}/usr/share/emacs/site-lisp/org-roam/"
}
