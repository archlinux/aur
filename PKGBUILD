# Maintainer: Jörg Horchler <joerg@horchler.xyz>

pkgname=gotask-taskfile-bin
_pkgname=gotask-taskfile
pkgver=3.5.0
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
sha256sums_x86_64=('e7fb4a47cd65ac0c33aeae3d447b2dcba24eb6b55a750220c0f616f9aa65226d')
sha256sums_i686=('f2d9c39c9623175ea749929a5f3ee0ebb59bf8dbc227e6ba40666685316fe2af')
sha256sums_aarch64=('b049dd6779c8e0f007c4c99f4a6c19ffe53d6b3e0035947538ad7a251a12e3be')
sha256sums_armv7h=('f24de6e49e41f8484665fd6a600bbf826ee22af70adb27237e227708dbf17c7e')

package() {
    install -Dm755 "${srcdir}/task" "${pkgdir}/usr/bin/gtask"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

