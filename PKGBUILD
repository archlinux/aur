# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
pkgname=docker-credential-pass-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Store docker credentials using the Standard Unix Password Manager (pass)"
arch=(x86_64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('pass')
makedepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("docker-credential-helpers-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/docker-credential-pass-v${pkgver}-amd64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v${pkgver}/LICENSE")
sha512sums=('299e604a910410b599cb4649ce08853348466cb4fd7c6870e41c6999f8fa2b6c7747d7b98cb687c66c7d66da0c07e3fb5c330a13d82d40d58a16160690ff4dc1'
            'ed166979b8cd757a3ca5e39093d8e56fe86be78e820de8da5cb9eb8e92f7b5715ce38f58548c2cb8ea6b22451ad40efc3f5bc0b811dc2d50c61c2c38c9ebc562')
noextract=()

package() {
    install -D -m 0755 "${srcdir}/docker-credential-pass" "${pkgdir}/usr/bin/docker-credential-pass"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
