# Maintainer: Jörg Horchler <joerg@horchler.xyz>

pkgname=gotask-taskfile-bin
_pkgname=gotask-taskfile
pkgver=3.7.0
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
sha256sums_x86_64=('3d3a2651fc28344dc0aea4291a72787a4b8bd172df95d59baa7f14e5bd0f7b2f')
sha256sums_i686=('19575832d835b1149a47116863158588e60d1f97f15a54507e384b375e4f8c3c')
sha256sums_aarch64=('dc8f99897ae9473bb703c662fa081e57fd223ab126113fc3c367a2df59a087c9')
sha256sums_armv7h=('b80ada95b4137e74bf6a2dd74dd49c21c6ec9f6d5c72f282d4728cb70cb515ac')

package() {
    install -Dm755 "${srcdir}/task" "${pkgdir}/usr/bin/gtask"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

