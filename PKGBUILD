# Maintainer: louson - Louis Rannou <louis dot rannou at gresille dot org>
# Contributor: Jon Eyolfson <jon@eyl.io>
pkgname=emacs-rust-mode
pkgver=1.0.4
pkgrel=2
pkgdesc="A major Emacs mode for editing Rust source code"
arch=('any')
url="https://github.com/rust-lang/rust-mode"
license=('Apache', 'MIT')
depends=('emacs')

install="${pkgname}.install"
source=("https://github.com/rust-lang/rust-mode/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e8eca03382d01a73bc00b29292d99ee2597023e0e97273e1b1969fb44f140f2e')

package() {
  cd "$srcdir/rust-mode-${pkgver}"
  for file in rust-mode.el rust-utils.el \
	      rust-cargo.el rust-compile.el rust-playpen.el rust-rustfmt.el
  do
      install -Dm644 "${file}" "${pkgdir}"/usr/share/emacs/site-lisp/rust-mode/"${file}"
  done
}

check () {
  cd "$srcdir/rust-mode-${pkgver}"
  make test
}
