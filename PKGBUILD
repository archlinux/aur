# -*- mode: shell-script -*-

# Code adapted from similar PKGBUILDS in the community repos (llvm,
# emacs-python-mode, and emacs-haskell-mode).

# Maintainer: ben01189998819991197253 <dev.ben01189998819991197253+aur@gmail.com>

pkgname='emacs-llvm-mode'
pkgdesc="Emacs syntax highlighting mode for LLVM IR"
install=emacs-llvm-mode.install
pkgver=8.0.0
pkgrel=1
arch=('any')
depends=('emacs')
url="https://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
source=(https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz)
sha256sums=('8872be1b12c61450cacc82b3d153eab02be2546ef34fa3580ed14137bb26224c')

package() {
    cd "$srcdir/llvm-$pkgver.src/utils/emacs"

    install -dm755 "$pkgdir/usr/share/emacs/site-lisp/$pkgname"
    install -Dm644 *.el -t "$pkgdir/usr/share/emacs/site-lisp/$pkgname"
    install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "../../LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
