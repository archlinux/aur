# Maintainer: Jörg Horchler <joerg@horchler.xyz>

pkgname=gotask-taskfile-bin
_pkgname=gotask-taskfile
pkgver=3.9.0
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
sha256sums_x86_64=('cad72446d2b939ec611fea14c48f7ce28713c68cc902701fb4f1c2b12fe1fd1c')
sha256sums_i686=('c927265a095204f18b73495936ad5d041267fe76b71626bb9b5ef726c7b91400')
sha256sums_aarch64=('03ef53f20c77572ce175ef9cbf3110ebda68e4b75450edc69ee756837cd7a9bd')
sha256sums_armv7h=('dfbfdcef356cbdd0c0554fbc7e7ba07554d484ef3e1c2aa2a0a1cea8eb70e39f')

package() {
    install -Dm755 "${srcdir}/task" "${pkgdir}/usr/bin/gtask"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

