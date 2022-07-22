# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>
_pkgname='dictd'
pkgname="${_pkgname}-runit"
pkgver=r4
pkgrel=2
pkgdesc="runit service scripts for dictd"
url="https://aur.archlinux.org/packages/${pkgname}"
arch=('any')
license=('GPL')
depends=('runit' 'dictd')
source=('dictd.run' 'dictd.finish')
sha256sums=('385133bb1030b109d85cd474be1e6a751e84ee2870813c19981f577779edaa2e'
            '5f3713fb8c6a611b06301353e3e3da38b4f6666da3f814a40171a89bd8ec34cc')

package() {
    cd "$srcdir"
    install -Dm755 'dictd.run' "${pkgdir}/etc/runit/sv/${_pkgname}/run"
    install -Dm755 'dictd.finish' "${pkgdir}/etc/runit/sv/${_pkgname}/finish"
}
