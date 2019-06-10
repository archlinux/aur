# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Rodrigo S. Wanderley <rodrigoswanderley@gmail.com>

_pkgname=netsed
pkgname=${_pkgname}-opt
pkgver=1.3.1
pkgrel=1
pkgdesc="Optionally alter the contents of packets forwarded through network in real time"
arch=("x86_64")
url="https://gitlab.com/Scrumplex/netsed-opt"
license=("GPL")

conflicts=("netsed")
provides=("netsed")

source=("https://gitlab.com/Scrumplex/netsed-opt/-/archive/${pkgver}/netsed-opt-${pkgver}.tar.gz")
sha512sums=('8de9f95d244a86628be091058ed6cd6e143916dff4176bbb1acf3951e648b43bd6780e2a1a49578ec1b82c970d389eb3094f0ee8859f350badb4aeef976c634b')


build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    install -D -m 0755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

    install -D -m 0644 LICENSE ${pkgdir}/usr/share/doc/${_pkgname}/LICENSE
    install -D -m 0644 NEWS ${pkgdir}/usr/share/doc/${_pkgname}/NEWS
    install -D -m 0644 README ${pkgdir}/usr/share/doc/${_pkgname}/README
    install -D -m 0644 TODO ${pkgdir}/usr/share/doc/${_pkgname}/TODO
}
