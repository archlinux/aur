# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=kss
pkgver=0.0.2
pkgrel=1
pkgdesc="Kubernetes pod status on steroid"
arch=('any')
url="https://github.com/chmouel/${pkgname}"
license=('Apache')
groups=('utils')
depends=('python>=3.6' 'kubectl' 'fzf')
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('6d64a264b66f429bdc0d0aa6bd453a5a58e49e627f30766fe0661b038322ac0d7bb3174c0237ca1ca4b302afa23f6b2f3af67721d9277c11267c55cb545f6a17')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # install binary
    install -D -m0755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

    # install zsh completion
    install -Dm644 "_kss" "${pkgdir}/usr/share/zsh/site-functions/_kss"
}
