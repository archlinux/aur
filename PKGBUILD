# Maintainer: UmamiAppearance <mail@umamiappearance.eu>

pkgname=base-ex-cli
pkgver=0.4.1
pkgrel=1
pkgdesc="CLI for BaseEx -- Base2-Base62, Base16, Base32, Base58, Base64, UUencode, Base85, Base91, LEB128, Ecoji, Base2048, BasePhi"
arch=(x86_64)
url=https://github.com/UmamiAppearance/BaseExCLI
license=("GPL")
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tgz")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=("0d63da9ac5ef03e6194982ba268a2d84c3a0a6120d5c259437e80566a91e6b32")

package() {
    npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}

