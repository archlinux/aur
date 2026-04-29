# Maintainer: Bogdan Szabo <contact@szabobogdan.com>
#
# This PKGBUILD is auto-updated by release.lash on each tagged release.
# pkgver and sha256sums are replaced; everything else stays put.

pkgname=lash-shell-bin
pkgver=0.12.2
pkgrel=1
pkgdesc="Dual-grammar shell and scripting language with debugger, LSP, and monitor"
arch=('x86_64')
url="https://lash.szabobogdan.com/"
license=('MIT')
depends=('glibc')
provides=('lash' 'lash-shell')
conflicts=('lash' 'lash-shell')
options=('!strip' '!debug')
source=("https://gitlab.com/szabobogdan3/lash/-/releases/v${pkgver}/downloads/lash-shell-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('9e27725fac2e53863b399ab13406a4753c7b70f70d852fe4eb65d534feb3f32c')

package() {
  cd "$srcdir"
  bsdtar -xf "lash-shell-${pkgver}-1-x86_64.pkg.tar.zst" -C "$pkgdir"
  # Strip Arch metadata from the wrapped pkg — makepkg generates its own.
  rm -f "$pkgdir/.PKGINFO" "$pkgdir/.MTREE" "$pkgdir/.BUILDINFO" "$pkgdir/.INSTALL"
}
