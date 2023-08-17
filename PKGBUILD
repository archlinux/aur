# Maintainer: Daniel Ramirez Chiquillo <hi@danielrachi.com>
pkgname=trin
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="An Ethereum portal client"
arch=('x86_64')
url="https://github.com/ethereum/trin"
license=('unknown')
groups=()
depends=('glibc' 'gcc-libs')
makedepends=('git' 'gcc' 'rust' 'openssl' 'clang' 'pkg-config' 'base-devel' 'llvm' )
checkdepends=()
optdepends=()
provides=(trin)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/ethereum/trin.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
    cd ${pkgname}

    export RUSTUP_TOOLCHAIN=stable
    cargo build --workspace --release
}

package() {
  cd ${pkgname}

  install -Dm755 "target/release/trin" "$pkgdir/usr/bin/trin"
}
