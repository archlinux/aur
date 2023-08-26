# Maintainer: Soma Zambelly <zambelly dot soma at gmail dot com>
pkgname=docker-credential-secretservice-bin
pkgver=0.8.0
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
sha512sums=('a1ec32f42738ef14bcec860cf84485853ef3184cd860c8e230fbdb08b0268f497fceb2bd616627fb1e4344b4141cffc770e098bc4caa24e032bef422eec08089'
    'ed166979b8cd757a3ca5e39093d8e56fe86be78e820de8da5cb9eb8e92f7b5715ce38f58548c2cb8ea6b22451ad40efc3f5bc0b811dc2d50c61c2c38c9ebc562')
noextract=()

package() {
    install -D -m 0755 "${srcdir}/docker-credential-secretservice-v${pkgver}.linux-amd64" "${pkgdir}/usr/bin/docker-credential-secretservice"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
