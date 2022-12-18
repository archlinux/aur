# Maintainer: Soma Zambelly <zambelly dot soma at gmail dot com>
pkgname=docker-credential-secretservice-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Store docker credentials using the D-Bus Secret Service"
arch=(x86_64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=()
makedepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${url}/releases/download/v${pkgver}/docker-credential-secretservice-v${pkgver}.linux-amd64"
    "LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v${pkgver}/LICENSE")
sha512sums=('e88559cbfcc28c2f395e552c2d3b9652be853e56dc84695d93ed3e26545c11a9205a7d5bf03b7141fbf7f3594d8bd4d6a7babcbffca45d51e2d48b02753740d1'
            'ed166979b8cd757a3ca5e39093d8e56fe86be78e820de8da5cb9eb8e92f7b5715ce38f58548c2cb8ea6b22451ad40efc3f5bc0b811dc2d50c61c2c38c9ebc562')
noextract=()

package() {
    install -D -m 0755 "${srcdir}/docker-credential-secretservice-v${pkgver}.linux-amd64" "${pkgdir}/usr/bin/docker-credential-secretservice"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
