# Maintainer: Aria Vesta <dev@ariavesta.com>
pkgname=kubelogin
pkgver=1.32.2
pkgrel=1
pkgdesc="Kubectl plugin for Kubernetes OpenID Connect authentication (oidc-login)"
arch=('x86_64' 'aarch64')
url="https://github.com/int128/kubelogin"
license=('Apache')
depends=('kubectl' 'glibc')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/int128/kubelogin/releases/download/v${pkgver}/kubelogin_linux_amd64.zip)
source_aarch64=(${pkgname}-${pkgver}.zip::https://github.com/int128/kubelogin/releases/download/v${pkgver}/kubelogin_linux_arm64.zip)
sha256sums_x86_64=('83cd392b0b53cbf4335e3fdbbef6ca1eb26831fb37369e9759169954ea8f7b7b')
sha256sums_aarch64=('996b6336bcda807493b13f3b4823981ca4f3444835825bf99eb4c0c749794366')

package() {
    install ${srcdir}/kubelogin -Dm755 "${pkgdir}/usr/bin/kubelogin"
    ln -sf "/usr/bin/kubelogin" "${pkgdir}/usr/bin/kubectl-oidc_login"
}
