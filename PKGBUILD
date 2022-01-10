# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jörg Horchler <joerg@horchler.xyz>

pkgname=gotask-taskfile-bin
_pkgname=gotask-taskfile
pkgver=3.10.0
pkgrel=1
pkgdesc="A task runner / simpler Make alternative written in Go (official binary version). Installs as gtask to allow coexistance with taskwarrior."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/go-task/task"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_386.tar.gz")
source_armv7h=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_arm.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_arm64.tar.gz")

sha256sums_x86_64=('f78c861e6c772a3263e478da7ae3223e10c2bc6b7b0728717d30db35d463f4b9')
sha256sums_i686=('90bb2d757f5bf621cf0e7fa24a5da8723025b8a862e3939ce74a888ad8ce1722')
sha256sums_armv7h=('d26b27e16450deca4b0b3614d0af81c3682e05bb1039d829e70868d6123132d5')
sha256sums_aarch64=('619cf2c3070b77f96475731f98b79ee8dabf248ccc8deb759c2c87b45a54fa4d')

package() {
  install -Dm755 "${srcdir}/task" "${pkgdir}/usr/bin/gtask"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
