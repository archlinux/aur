# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=kss
pkgver=0.3.0
pkgrel=1
pkgdesc="Kubernetes pod status on steroid"
arch=('any')
url="https://github.com/chmouel/${pkgname}"
license=('Apache')
groups=('utils')
depends=('python>=3.6' 'kubectl' 'fzf')
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('251b3b91439be206ddaed5fd2bb6b6f23d3944436ed8fdc2befa27c8e3f29f839d9f5dc5082d2794aae2fa19c70860b309ab92ae07275a5628e0efe212cce486')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # install binary
    install -D -m0755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

    # install zsh completion
    install -Dm644 "_kss" "${pkgdir}/usr/share/zsh/site-functions/_kss"
}
