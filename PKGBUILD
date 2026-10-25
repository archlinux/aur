# Maintainer: fr0stb1rd <fr0stb1rd@proton.me>
#
# Why "baseline" on x86_64:
# The project ships AVX2 and baseline variants. makepkg builds one package per
# arch that must work on every CPU of that arch, so we ship the baseline build.
# It runs anywhere; the AVX2 build would SIGILL on x86_64 CPUs without AVX2.
#
# The tarball contains a single self-contained binary (no runtime deps).
# Mirror of the logic the project's install.sh uses to pick an asset.

pkgname=pentestcode-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="AI-powered autonomous penetration testing agent for your terminal (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/s0ld13rr/pentestcode"
license=('MIT')
depends=()
source_x86_64=("https://github.com/s0ld13rr/pentestcode/releases/download/v${pkgver}/pentestcode-linux-x64-baseline.tar.gz")
source_aarch64=("https://github.com/s0ld13rr/pentestcode/releases/download/v${pkgver}/pentestcode-linux-arm64.tar.gz")
sha256sums_x86_64=('1e7f7e750a3f9315e335835c32c3831e16a4613190b92d9fc7b85103c1927f85')
sha256sums_aarch64=('6027173aeebd74367f6888bc47b14f4ef1b3c04db2f25d9a03fbc59e0c3c68db')

package() {
  install -Dm755 "pentestcode" "${pkgdir}/usr/bin/pentestcode"
}
