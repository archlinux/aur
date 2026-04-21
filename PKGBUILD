# Maintainer: Ary Kleinerman <kleinerman at gmail dot com>
pkgname=kubelogin-bin
pkgver=1.36.1
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
sha256sums_x86_64=('a6dae91dfedd564906d892b1bdb1b74d821808802263b95751ca8e95cb1c0936')
sha256sums_aarch64=('b6790c4991d9ec13fca3c9375635608874434da4a5476b8567e65302c852690e')

package() {
    install -Dm755 "${srcdir}/kubelogin" "${pkgdir}/usr/bin/kubelogin"
    ln -s kubelogin "${pkgdir}/usr/bin/kubectl-oidc_login"
}
