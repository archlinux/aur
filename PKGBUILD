# Maintainer: Parker Johansen <johansen.parker@gmail.com>
pkgname=kubelogin
pkgver=1.29.0
pkgrel=1
pkgdesc="Kubectl plugin for Kubernetes OpenID Connect authentication (oidc-login)"
arch=('x86_64' 'aarch64')
url="https://github.com/int128/kubelogin"
license=('Apache')
depends=('kubectl' 'glibc')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/int128/kubelogin/releases/download/v${pkgver}/kubelogin_linux_amd64.zip)
source_aarch64=(${pkgname}-${pkgver}.zip::https://github.com/int128/kubelogin/releases/download/v${pkgver}/kubelogin_linux_arm64.zip)
sha256sums_x86_64=('60b64c524ff525baa6cbbf0dcd40aa325cb653c0f8000d9ae40e33b1a98d1159')
sha256sums_aarch64=('d67ffbf4ae67eb830f70f332f4f8ac3482d7cf0f7594828dc3f704fad4ea29a8')

package() {
    install ${srcdir}/kubelogin -Dm755 "${pkgdir}/usr/bin/kubelogin"
    ln -sf "/usr/bin/kubelogin" "${pkgdir}/usr/bin/kubectl-oidc_login"
}
