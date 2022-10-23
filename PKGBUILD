# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=slaunch
pkgver=0.3.0
pkgrel=1
pkgdesc="Tiny helper to run applications in their own cgroups"
url="https://git.sr.ht/~whynothugo/slaunch"
license=("ISC")
arch=("x86_64" "aarch64")
makedepends=("git" "rust")
source=("git+https://git.sr.ht/~whynothugo/slaunch#tag=v${pkgver}?signed")
sha256sums=('SKIP')
validpgpkeys=("1204CA9FC2FFADEEDC2961367880733B9D062837")

package() {
  cd "$srcdir/$pkgname"

  export RUSTUP_TOOLCHAIN=stable
  cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
}
