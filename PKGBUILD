# Maintainer: Jörg Horchler <joerg@horchler.xyz>

pkgname=gotask-taskfile-bin
_pkgname=gotask-taskfile
pkgver=3.7.3
pkgrel=1
pkgdesc="A task runner / simpler Make alternative written in Go (official binary version). Installs as gtask to allow coexistance with taskwarrior."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://taskfile.dev/"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_amd64.tar.gz")
source_i686=("https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_386.tar.gz")
source_aarch64=("https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_arm64.tar.gz")
source_armv7h=("https://github.com/go-task/task/releases/download/v${pkgver}/task_linux_arm.tar.gz")
sha256sums_x86_64=('23e670ab136e25dad74b3c7d97900f7c2879c6874ccaae29e6fc041061be5fb4')
sha256sums_i686=('5f435d8633d37666f038f52b0420f2cf3e6d9ef5546d01634b5c22d2d2df9bd2')
sha256sums_aarch64=('1293450f2c99c6c79a9a86fb4a8538bd5c14783b47e731f8259932e2e727144b')
sha256sums_armv7h=('2dc4f55cbb87f21f86182c6904b7a55439baa636922b0266757d5da22149819b')

package() {
    install -Dm755 "${srcdir}/task" "${pkgdir}/usr/bin/gtask"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

