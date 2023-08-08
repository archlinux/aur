# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
pkgname=docker-credential-pass-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Store docker credentials using the Standard Unix Password Manager (pass)"
arch=(x86_64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('pass')
makedepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("docker-credential-pass-v${pkgver}.linux-amd64::${url}/releases/download/v${pkgver}/docker-credential-pass-v${pkgver}.linux-amd64"
        "LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v${pkgver}/LICENSE")
sha512sums=('6e68b616fe6b225e2e923813179a4b134a81df553e4b178f2c045ad69f1750f860efc6b2bc1ef619f60f2d2535869adf7a3cce3c593a29a8ffc69e6a7508aa04'
            'ed166979b8cd757a3ca5e39093d8e56fe86be78e820de8da5cb9eb8e92f7b5715ce38f58548c2cb8ea6b22451ad40efc3f5bc0b811dc2d50c61c2c38c9ebc562')
noextract=()

package() {
    install -D -m 0755 "${srcdir}/docker-credential-pass-v${pkgver}.linux-amd64" "${pkgdir}/usr/bin/docker-credential-pass"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
