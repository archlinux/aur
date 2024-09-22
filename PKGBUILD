# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=typos-lsp-bin
pkgver=0.1.24
pkgrel=1
pkgdesc='Source code spell checker for Visual Studio Code and LSP clients'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/tekumara/typos-lsp'
license=('MIT')
makedepends=()
depends=("gcc-libs" "glibc")

source_x86_64=("typos-vscode-${pkgver}-x86_64.vsix::https://marketplace.visualstudio.com/_apis/public/gallery/publishers/tekumara/vsextensions/typos-vscode/${pkgver}/vspackage?targetPlatform=linux-x64")
source_aarch64=("typos-vscode-${pkgver}-aarch64.vsix::https://marketplace.visualstudio.com/_apis/public/gallery/publishers/tekumara/vsextensions/typos-vscode/${pkgver}/vspackage?targetPlatform=linux-arm64")
source_armv7h=("typos-vscode-${pkgver}-armv7h.vsix::https://marketplace.visualstudio.com/_apis/public/gallery/publishers/tekumara/vsextensions/typos-vscode/${pkgver}/vspackage?targetPlatform=linux-armhf")
sha256sums_x86_64=('cf4f6bf9c8dafd4b23cf7d56d42626ecdc5fb8b67f453958ec338d5cc6c44f4a')
sha256sums_aarch64=('fcb7f6042c350e33c8ca0e0db37e0139de8de08785d08d1467c552ab7dd70c11')
sha256sums_armv7h=('b6ba9ec8dffa02f209d87ba8155a59f3e4ff96bda50ff41d4e3816a33c9de139')

package() {
	install -Dm755 "./extension/bundled/${pkgname/-bin/}" "$pkgdir/usr/bin/${pkgname/-bin/}"
	install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
