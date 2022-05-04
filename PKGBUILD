# Maintainer: Soma Zambelly <zambelly dot soma at gmail dot com>
pkgname=docker-credential-secretservice-bin
pkgver=0.6.4
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
sha512sums=('2cbf641eeabf0a1fd6ff864fbf68f4e0015293475328e5e6fe9662a5c39fe51010702ab162d77108e2c130508f4f9e9e41825bc13e85129b297d00553acd64c5'
            'ed166979b8cd757a3ca5e39093d8e56fe86be78e820de8da5cb9eb8e92f7b5715ce38f58548c2cb8ea6b22451ad40efc3f5bc0b811dc2d50c61c2c38c9ebc562')
noextract=()

package() {
    install -D -m 0755 "${srcdir}/docker-credential-secretservice" "${pkgdir}/usr/bin/docker-credential-secretservice"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
