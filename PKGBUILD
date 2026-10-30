# Maintainer: Moriaan Michiels <moriaan.michiels@gmail.com>
pkgname=jcd-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="Fuzzy cd alternative"
arch=('x86_64')
url="https://github.com/MnM72809/jcd"
license=('MIT')
provides=('jcd' 'jcd-debug')
conflicts=('jcd' 'jcd-debug')
depends=('glibc')
source=("https://github.com/MnM72809/jcd/releases/download/v${pkgver}/jcd-${pkgver}-Linux.tar.gz"
	    "LICENSE-v${pkgver}::https://raw.githubusercontent.com/MnM72809/jcd/v${pkgver}/LICENSE")
sha256sums=('1c9703a8452d66e6f98af5cb23c022c7b7fbdcf9c200896b1f1583c74f449673'
            'a5627bef44bc0e0741bf88d219db45a244651c6e6518bf8a09b1b982a84e1595')

package() {
	install -Dm755 "${srcdir}/jcd-${pkgver}-Linux/bin/jcd" "${pkgdir}/usr/bin/jcd"
	install -Dm644 "${srcdir}/LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
