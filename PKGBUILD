# Maintainer: Jarvy Team <team@jarvy.dev>
# AUR Package: jarvy-bin (pre-compiled binary)

pkgname=jarvy-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Fast, cross-platform CLI that installs and manages developer tools (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/Cliftonz/jarvy"
license=('MIT' 'Apache-2.0')
provides=('jarvy')
conflicts=('jarvy')
depends=('gcc-libs')

# x86_64 is shipped as a statically-linked MUSL binary (works on any
# glibc / musl system, including Arch). aarch64 is built against the
# GNU toolchain because the aarch64 cross-rust toolchain pairs with
# the gcc-aarch64-linux-gnu sysroot in CI. Both binaries land in the
# same release at `jarvy-v${pkgver}-${TRIPLE}.tar.gz` per
# .github/workflows/release.yml "Package raw Linux tarball" step.
source_x86_64=("https://github.com/Cliftonz/jarvy/releases/download/v${pkgver}/jarvy-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/Cliftonz/jarvy/releases/download/v${pkgver}/jarvy-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('cdfbfdb0d6f19bef52815b25033e154e9c5d9cb59bb814ed271eb870e28dd77e')
sha256sums_aarch64=('e9d372a507600c4d1bcc26bbd9c04f1b17e73e492bdd221d3797a6e65f5342e6')

package() {
    install -Dm755 "jarvy" "$pkgdir/usr/bin/jarvy"
}
