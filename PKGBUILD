# Maintainer: Traube1000101 <girlscoutcookies420@gmx.net>
pkgname=deploy-docker
pkgver=1.0
pkgrel=2
pkgdesc="Builds and deploys a docker image to a registry"
arch=('any')
url="https://github.com/Traube1000101/${pkgname}"
license=('GPL-3.0')
depends=(
    'bash'
    'docker'
    'util-linux'
)
source=("https://github.com/Traube1000101/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('5e07f7e00b64f0f46b10bfe2bbab882b0eea907f48912c4ff6d0dfed96d2b4b073f0faa0934d909fa644b5854ee64860fad6d9c242e5abb5b8c82ad56781b601')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    make DESTDIR="$pkgdir" install
    install -D -m444 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
