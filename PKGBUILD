# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
pkgname=docker-credential-pass-bin
pkgver=0.6.4
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
sha512sums=('1c0d16cc165085e2b226903b6550afdd05067c016bf313d42b7dfc47108be4d3626786a6c3a2de778f3851d489f8e93f0239bb2542aa2fde1cde83c7c726d4a4'
            'ed166979b8cd757a3ca5e39093d8e56fe86be78e820de8da5cb9eb8e92f7b5715ce38f58548c2cb8ea6b22451ad40efc3f5bc0b811dc2d50c61c2c38c9ebc562')
noextract=()

package() {
    install -D -m 0755 "${srcdir}/docker-credential-pass" "${pkgdir}/usr/bin/docker-credential-pass"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
