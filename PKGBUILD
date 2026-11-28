# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dtctl-bin
pkgver=0.47.0
pkgrel=1
pkgdesc="Manage Dynatrace platform resources from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/Dynatrace/dtctl"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dtctl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dtctl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d5df2d258c8a2d7717b40c558bda7a3f4a4c7147cc30c84745f79f9f06b8053e')
sha256sums_aarch64=('63f681e70148f87f1dc590c562de83c26437c9ba1442809eb04a61dab8cf6c39')

package() {
  install -Dm755 "dtctl" "${pkgdir}/usr/bin/dtctl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "completions/dtctl.bash" "${pkgdir}/usr/share/bash-completion/completions/dtctl"
  install -Dm644 "completions/dtctl.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/dtctl.fish"
  install -Dm644 "completions/dtctl.zsh" "${pkgdir}/usr/share/zsh/site-functions/_dtctl"
}
