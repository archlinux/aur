# Maintainer: louson - Louis Rannou <louis dot rannou at gresille dot org>
# Contributor: Jon Eyolfson <jon@eyl.io>
pkgname=emacs-rust-mode
pkgver=1.0.5
pkgrel=1
pkgdesc="A major Emacs mode for editing Rust source code"
arch=('any')
url="https://github.com/rust-lang/rust-mode"
license=('Apache', 'MIT')
depends=('emacs')

install="${pkgname}.install"
source=("https://github.com/rust-lang/rust-mode/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5a34e38a2cca32cdddc13ca427aa47dc13b1b99e6a44c3d006072519e6cc3b65')

package() {
  cd "$srcdir/rust-mode-${pkgver}"
  for file in rust-mode.el rust-utils.el \
	      rust-cargo.el rust-compile.el rust-playpen.el rust-rustfmt.el
  do
      install -Dm644 "${file}" "${pkgdir}"/usr/share/emacs/site-lisp/rust-mode/"${file}"
  done
}
