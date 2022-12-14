# Maintainer: UmamiAppearance <mail@umamiappearance.eu>

pkgname=base-ex-cli
pkgver=0.2.5
pkgrel=1
pkgdesc="CLI for BaseEx (base conversion)"
arch=(x86_64)
url=https://github.com/UmamiAppearance/BaseExCLI
license=("GPL")
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tgz")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=("c999ea106bf8252e690ab5167ea06e2af82d59cee0468d0548248f120f81b63b")

package() {
    npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}

