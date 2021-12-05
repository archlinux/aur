# Maintainer: Jörg Horchler <joerg@horchler.xyz>

pkgname=gotask-taskfile-bin
_pkgname=gotask-taskfile
pkgver=3.9.2
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
sha256sums_x86_64=('80f0018f46bbf430d230bb049500219838e1fd08363c11514a2eff5988f9f0e3')
sha256sums_i686=('07b26059121fd637ff60add734ff4f9bb493b97330e1050c62faca0f0768fd19')
sha256sums_aarch64=('834b75622d325b853b2896dd3b916b97a0ef007780b93513c6cf1d687d99c5cb')
sha256sums_armv7h=('ae5c5544111ffd0e439e42cff9c9147b5d23b24bea10a374e5bc4840e5d015a6')

package() {
    install -Dm755 "${srcdir}/task" "${pkgdir}/usr/bin/gtask"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
