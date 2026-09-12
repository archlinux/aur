# Maintainer: fr0stb1rd <fr0stb1rd at proton dot me>
#
# Why "baseline" on x86_64:
# The project ships AVX2 and baseline variants. makepkg builds one package per
# arch that must work on every CPU of that arch, so we ship the baseline build.
# It runs anywhere; the AVX2 build would SIGILL on x86_64 CPUs without AVX2.
#
# The tarball contains a single self-contained binary (no runtime deps).
# Mirror of the logic the project's install.sh uses to pick an asset.

pkgname=pentestcode-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="AI-powered autonomous penetration testing agent for your terminal (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/s0ld13rr/pentestcode"
license=('MIT')
depends=()
source_x86_64=("https://github.com/s0ld13rr/pentestcode/releases/download/v${pkgver}/pentestcode-linux-x64-baseline.tar.gz")
source_aarch64=("https://github.com/s0ld13rr/pentestcode/releases/download/v${pkgver}/pentestcode-linux-arm64.tar.gz")
sha256sums_x86_64=('e6c6786a1dbd4c0f3dcbfd957886b0d65f7c25c5b66e5821cd0486304ed3206a')
sha256sums_aarch64=('2d37792a41b1ab27437405e00c86fc68700a5a1a24e67872b1666ba37d045d31')

package() {
  install -Dm755 "pentestcode" "${pkgdir}/usr/bin/pentestcode"
}
