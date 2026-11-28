# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kc-ssh-pam-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="SSH authentication against Keycloak OIDC via PAM"
arch=('x86_64' 'aarch64')
url="https://github.com/kha7iq/kc-ssh-pam"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kha7iq/kc-ssh-pam/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kc-ssh-pam_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kc-ssh-pam_linux_arm64.tar.gz")
sha256sums=('6b0e1c02e95350225aebbb228d7e1a147fef3b86ee061dd49cffaebb50179a58')
sha256sums_x86_64=('965076fcc588f4f1dfb274b56b25b596e974d171bc7dead41ff587d66b07e938')
sha256sums_aarch64=('68074ee156aac91844b89b35da1b913a887d5037e34bc709655dad9f3e42ee59')

package() {
  install -Dm755 "kc-ssh-pam" "${pkgdir}/usr/bin/kc-ssh-pam"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
