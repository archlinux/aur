# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=d2vm-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Build virtual machine images from a Dockerfile or Docker image"
arch=('x86_64' 'aarch64')
url="https://github.com/linka-cloud/d2vm"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/d2vm_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/d2vm_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9f2096bc7850367d063cbcf2da8ded6c5a23e70a9b0ecfdde150b2fbc9b8bd2f')
sha256sums_aarch64=('bb8a6c96557fba67b42a34a0777a65fd91af46fff523611b2cc9e28f801117c6')

package() {
  install -Dm755 "d2vm" "${pkgdir}/usr/bin/d2vm"
  install -Dm644 "LICENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "completions/d2vm.bash" "${pkgdir}/usr/share/bash-completion/completions/d2vm"
  install -Dm644 "completions/d2vm.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/d2vm.fish"
  install -Dm644 "completions/d2vm.zsh" "${pkgdir}/usr/share/zsh/site-functions/_d2vm"
}
