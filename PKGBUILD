# Maintainer: Aria Vesta <dev@ariavesta.com>
pkgname=kubelogin
pkgver=1.34.0
pkgrel=1
pkgdesc="Kubectl plugin for Kubernetes OpenID Connect authentication (oidc-login)"
arch=('x86_64' 'aarch64')
url="https://github.com/int128/kubelogin"
license=('Apache')
depends=('kubectl' 'glibc')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/int128/kubelogin/releases/download/v${pkgver}/kubelogin_linux_amd64.zip)
source_aarch64=(${pkgname}-${pkgver}.zip::https://github.com/int128/kubelogin/releases/download/v${pkgver}/kubelogin_linux_arm64.zip)
sha256sums_x86_64=('9f68bd3fb1427fd12befe492a45a309bcb341d1bdff0d090052cfe3833291529')
sha256sums_aarch64=('97a0d6884796f208bc408e39f0fdf72a9752490c3dd12194c24389775857564f')

package() {
    install ${srcdir}/kubelogin -Dm755 "${pkgdir}/usr/bin/kubelogin"
    ln -sf "/usr/bin/kubelogin" "${pkgdir}/usr/bin/kubectl-oidc_login"
}
