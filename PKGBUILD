# Maintainer: Soma Zambelly <zambelly dot soma at gmail dot com>
# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=docker-credential-secretservice-bin
pkgver=0.9.4
pkgrel=3
pkgdesc="Store docker credentials using the D-Bus Secret Service"
arch=('x86_64' 'aarch64')
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=()
makedepends=()
options=("!debug")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=(
    "${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/docker-credential-secretservice-v${pkgver}.linux-amd64"
    "LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v${pkgver}/LICENSE"
)

source_aarch64=(
    "${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/docker-credential-secretservice-v${pkgver}.linux-arm64"
    "LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v${pkgver}/LICENSE"
)

b2sums_x86_64=('08fa5d1e4d7b0a9f5a1217d36df89150a6438e97c66117939fc64f1d20d7a2821f7a5dc276fcb1d4ff66b7929bb778e6f6fbf70cb47fa4d35e8be011760a2e59'
               '7e5e1fc19b9fd4204acb61ea546d7ff33b1b7d913a27680a4a032365312e4a488ff4b3ac498d8c80c8ce374d7700085ed71b46f75438cd9d6bbee653be209806')
b2sums_aarch64=('48e3061ade3cb8bc4afb9fd94c839b3fa4aca9b5fb70fb17bad6d1786cf33890b713fbf88b4af8315072f2d91079719db58f4c8444452db1b347227b799b4eaa'
                '7e5e1fc19b9fd4204acb61ea546d7ff33b1b7d913a27680a4a032365312e4a488ff4b3ac498d8c80c8ce374d7700085ed71b46f75438cd9d6bbee653be209806')

package() {
    install -D -m 0755 "${srcdir}/${pkgname}-${pkgver}-${arch}" "${pkgdir}/usr/bin/docker-credential-secretservice"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
