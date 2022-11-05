# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=kss
pkgver=0.2.0
pkgrel=1
pkgdesc="Kubernetes pod status on steroid"
arch=('any')
url="https://github.com/chmouel/${pkgname}"
license=('Apache')
groups=('utils')
depends=('python>=3.6' 'kubectl' 'fzf')
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('83ad45e35dac2128a6f094a36265ba2ecde8cb9455d79abcd20c9505fd2a90126a6ab09204b32cd2553e833088e7bf8f76e8f72f5dab0d6741861d5c7be68e69')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # install binary
    install -D -m0755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

    # install zsh completion
    install -Dm644 "_kss" "${pkgdir}/usr/share/zsh/site-functions/_kss"
}
