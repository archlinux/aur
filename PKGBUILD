# Maintainer: Your Name <youremail@domain.com>
pkgname=jaro
pkgver=1.0.0
_pkgver="${pkgver}-beta"

pkgrel=1
pkgdesc="a highly customizable xdg-open alternative"
arch=('any')
url="https://github.com/isamert/jaro"
license=('GPL-3.0-only')
makedepends=('guile')
optdepends=('perl-file-mimeinfo')
provides=('jaro')
install=${pkgname}.install
source=("$pkgname-$_pkgver.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz"
        "associations")
sha256sums=('d9b5e15e199adc56d7aefe3aff051bb048659659e9b813550d38ef4af6aeb8f6'
            'c481391685dc674880ae01b57fdf86bf406ef55014eecb47dde10e51bbd5ca16')


package() {
	cd "$srcdir/${pkgname}-${_pkgver}"
    install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"  
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/${pkgname}/README.md"
	cd "$srcdir"
    install -Dm644 "associations" "${pkgdir}/usr/share/${pkgname}/associations"
}
