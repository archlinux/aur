# Maintainer: Thomas Butler <goliyth@gmail.com>
pkgname=fnclaude-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A claude CLI launcher with quality-of-life features (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/fnrhombus/fnclaude"
license=('MIT')
provides=('fnclaude')
conflicts=('fnclaude')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/fnrhombus/fnclaude/releases/download/v$pkgver/fnclaude_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/fnrhombus/fnclaude/releases/download/v$pkgver/fnclaude_Linux_arm64.tar.gz")
sha256sums_x86_64=('ae6d5b0547ffb25e74f0446b6a93fd692c9b85cb3c7f9a2776e7eb6595ae183f')
sha256sums_aarch64=('fbd7ccee6fd284a9ca3a93b0f2416fedf0dccfe490e21d2ed3da68bd66242d81')

package() {
    install -Dm755 fnclaude "$pkgdir/usr/bin/fnclaude"
    # `fnc` is the ergonomic shortcut shipped alongside fnclaude. Shell
    # completions in this repo already register both names.
    ln -s fnclaude "$pkgdir/usr/bin/fnc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
