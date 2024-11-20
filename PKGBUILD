# Maintainer: Parker Johansen <johansen.parker@gmail.com>
pkgname=kubelogin
pkgver=1.28.2
pkgrel=1
pkgdesc="Kubectl plugin for Kubernetes OpenID Connect authentication (oidc-login)"
arch=('x86_64' 'aarch64')
url="https://github.com/int128/kubelogin"
license=('Apache')
depends=('kubectl' 'glibc')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/int128/kubelogin/releases/download/v${pkgver}/kubelogin_linux_amd64.zip)
source_aarch64=(${pkgname}-${pkgver}.zip::https://github.com/int128/kubelogin/releases/download/v${pkgver}/kubelogin_linux_arm64.zip)
sha256sums_x86_64=('6bf51e2443ae750cc8db76a5e1b828b2bc1db31bd9b69146ab4efcecfc1395cc')
sha256sums_aarch64=('f315f25e5cbf21e63f62ae2d4c4922a30cc8f6e6ceec9993733a562986b5cedb')

package() {
    install ${srcdir}/kubelogin -Dm755 "${pkgdir}/usr/bin/kubelogin"
    ln -sf "/usr/bin/kubelogin" "${pkgdir}/usr/bin/kubectl-oidc_login"
}
