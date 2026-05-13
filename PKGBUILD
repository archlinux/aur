# Maintainer: Thomas Butler <goliyth@gmail.com>
pkgname=fnclaude-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A claude CLI launcher with quality-of-life features (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/fnrhombus/fnclaude"
license=('MIT')
provides=('fnclaude')
conflicts=('fnclaude')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/fnrhombus/fnclaude/releases/download/v$pkgver/fnclaude_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/fnrhombus/fnclaude/releases/download/v$pkgver/fnclaude_Linux_arm64.tar.gz")
sha256sums_x86_64=('cac927ee47db12f24dcc64555263e90d3c52a6b908ddb8edc0d2a81943cf0541')
sha256sums_aarch64=('293985be63a51f8c316b138fe8883ab55f1f571fef3d4cb20dacf10fbccb1759')

package() {
    install -Dm755 fnclaude "$pkgdir/usr/bin/fnclaude"
    # `fnc` is the ergonomic shortcut shipped alongside fnclaude. Shell
    # completions in this repo already register both names.
    ln -s fnclaude "$pkgdir/usr/bin/fnc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
