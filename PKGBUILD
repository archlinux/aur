# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jörg Horchler <joerg@horchler.xyz>

pkgname=go-task-bin
_pkgname=go-task
pkgver=3.12.1
pkgrel=2
pkgdesc="Task runner & Make alternative that runs taskfiles (Installs as go-task to avoid conflict with taskwarrior)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/go-task/task"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "gotask-taskfile-bin")
replaces=('gotask-taskfile-bin')

source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_386.tar.gz")
source_armv7h=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_arm.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_arm64.tar.gz")

sha256sums_x86_64=('b9c5986f33a53094751b5e22ccc33e050b4a0a485658442121331cbb724e631e')
sha256sums_i686=('b8e7cc6170973bae6fd60da410c3b19b6b6aa55dbb5c9cd3536a78a6ed7cc5d6')
sha256sums_armv7h=('b10ae7d85749025740097b0c349b946fbabd417c7ee4d2df8ccc5604750accd9')
sha256sums_aarch64=('44fad3d61ad39d0abff33f90fdbb99a666524dbeab08dc9d138d5d3a532ff68a')

package() {
  install -Dm755 "${srcdir}/task" "${pkgdir}/usr/bin/go-task"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
