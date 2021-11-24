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
sha512sums=('2863c1b235d7c4708fd9dd7dcbffa9eb260f378e1981d6ab62948fe6ab606da4cca741867307b7574518fe70a6f881c68bf9416e19baf8c50464d6b8e2e2722a')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # install binary
    install -D -m0755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

    # install zsh completion
    install -Dm644 "_kss" "${pkgdir}/usr/share/zsh/site-functions/_kss"
}
