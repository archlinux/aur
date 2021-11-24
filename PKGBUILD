# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=kss
pkgver=0.1.0
pkgrel=1
pkgdesc="Kubernetes pod status on steroid"
arch=('any')
url="https://github.com/chmouel/${pkgname}"
license=('Apache')
groups=('utils')
depends=('python>=3.6' 'kubectl' 'fzf')
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('1cff4f01a647047eccf69da65f28e9c3c60116e118545522af70c5a8d577bfad2ba412555f760c48b84ff6599b8064254bfed74a6067290728d0faf541b67696')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # install binary
    install -D -m0755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

    # install zsh completion
    install -Dm644 "_kss" "${pkgdir}/usr/share/zsh/site-functions/_kss"
}
