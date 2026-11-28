# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubesplaining-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Kubernetes security assessment for RBAC, pod escape and privilege escalation paths"
arch=('x86_64' 'aarch64')
url="https://github.com/0hardik1/kubesplaining"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kubesplaining_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kubesplaining_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('975eff19ab0483d8166bfd922ecc865df1c2aa3df25886bfd5f328e82416a132')
sha256sums_aarch64=('70cba89dc711264b0c30ce6505af37679580a9889acff20fd05cb0d628fb195c')

package() {
  install -Dm755 "kubesplaining" "${pkgdir}/usr/bin/kubesplaining"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
