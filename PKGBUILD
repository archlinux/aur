# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=falcoctl-bin
pkgver=0.14.3
pkgrel=1
pkgdesc="Administrative tooling for Falco"
arch=('x86_64' 'aarch64')
url="https://github.com/falcosecurity/falcoctl"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/falcoctl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/falcoctl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('263a6c773b4d24af1e6827ea2f63ac7c50678becf58e607390eb8976dee08af1')
sha256sums_aarch64=('527a81cba5e42b283466aa74942d0eb6ea044aa969f9cf86f3ef856cbe636b36')

package() {
  install -Dm755 "falcoctl" "${pkgdir}/usr/bin/falcoctl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
