# Maintainer: Aria Vesta <dev@ariavesta.com>
pkgname=kubelogin
pkgver=1.32.3
pkgrel=1
pkgdesc="Kubectl plugin for Kubernetes OpenID Connect authentication (oidc-login)"
arch=('x86_64' 'aarch64')
url="https://github.com/int128/kubelogin"
license=('Apache')
depends=('kubectl' 'glibc')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/int128/kubelogin/releases/download/v${pkgver}/kubelogin_linux_amd64.zip)
source_aarch64=(${pkgname}-${pkgver}.zip::https://github.com/int128/kubelogin/releases/download/v${pkgver}/kubelogin_linux_arm64.zip)
sha256sums_x86_64=('c065f95401f96e548a835838aaf0834dba9d347a0e5af2f38664272a66e2d948')
sha256sums_aarch64=('c065f95401f96e548a835838aaf0834dba9d347a0e5af2f38664272a66e2d948')

package() {
    install ${srcdir}/kubelogin -Dm755 "${pkgdir}/usr/bin/kubelogin"
    ln -sf "/usr/bin/kubelogin" "${pkgdir}/usr/bin/kubectl-oidc_login"
}
