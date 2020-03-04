pkgname=docker-credential-secretservice-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Store docker credentials using the D-Bus Secret Service"
arch=(x86_64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=()
makedepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("docker-credential-helpers-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/docker-credential-secretservice-v${pkgver}-amd64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v${pkgver}/LICENSE")
sha512sums=('49db85f4a98a1702dd809b77540d2a1840f27f16abadec827732e56ddcb8ef30447496965819349373ce31ec55028cc3fac799bab02de281a297d7475fb01d49'
            'ed166979b8cd757a3ca5e39093d8e56fe86be78e820de8da5cb9eb8e92f7b5715ce38f58548c2cb8ea6b22451ad40efc3f5bc0b811dc2d50c61c2c38c9ebc562')
noextract=()

package() {
    install -D -m 0755 "${srcdir}/docker-credential-secretservice" "${pkgdir}/usr/bin/docker-credential-secretservice"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et: