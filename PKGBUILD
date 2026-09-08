# Maintainer: Ary Kleinerman <kleinerman at gmail dot com>
pkgname=kubelogin-bin
pkgver=1.36.4
pkgrel=1
pkgdesc="Kubectl plugin for Kubernetes OpenID Connect authentication (oidc-login)"
arch=('x86_64' 'aarch64')
url="https://github.com/int128/kubelogin"
license=('Apache-2.0')
depends=('kubectl' 'glibc')
provides=('kubelogin')
conflicts=('kubelogin')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/kubelogin_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/kubelogin_linux_arm64.zip")
sha256sums_x86_64=('9e8baeb4905d35a301304af2548324997add512fe94ab20e65993d167212bf85')
sha256sums_aarch64=('669c2d3bcc6766351ad5a7b03971792b4e7a55117b335a12d9858d43a525d9dc')

package() {
    install -Dm755 "${srcdir}/kubelogin" "${pkgdir}/usr/bin/kubelogin"
    ln -s kubelogin "${pkgdir}/usr/bin/kubectl-oidc_login"
}
