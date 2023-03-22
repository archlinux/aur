# Maintainer: UmamiAppearance <mail@umamiappearance.eu>

pkgname=base-ex-cli
pkgver=0.3.4
pkgrel=1
pkgdesc="CLI for BaseEx -- Base2-Base62, Base16, Base32, Base58, Base64, UUencode, Base85, Base91, LEB128, Ecoji, Base2048, BasePhi"
arch=(x86_64)
url=https://github.com/UmamiAppearance/BaseExCLI
license=("GPL")
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tgz")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=("2db04cd0a0cd655bab98bfd4fde6ae54d11fc07e065c36ce0363a44c161a6888")

package() {
    npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
