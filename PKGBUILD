# Maintainer: Felix Seidel <felix@seidel.me>

pkgname=1password-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm')
url="https://app-updates.agilebits.com/product_history/CLI"
license=('custom')
options=('!strip' '!emptydirs')

source_x86_64=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_amd64_v$pkgver.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_386_v$pkgver.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_arm_v$pkgver.zip")

sha256sums_x86_64=('6dc01dce5138f5ec8c6d6853fb22d02cfe1c0b0178f02754278d4dcac11f038b')
sha256sums_i686=('b0edd3b2125e9bab79c7371b00f3356b37a073c65a9ca72c7b7984700e20a881')
sha256sums_arm=('83aee44c19db20404d18bf2f1ce466294865b1f7a4f0e48bc0f925dc3dd3499d')

check() {
  gpg --verify-files ${srcdir}/op.sig
}

package() {
  install -Dm755 op "$pkgdir/usr/bin/op"
}

# vim:set ts=2 sw=2 et:
