# Maintainer: dtluna <dtluna at waifu dot club>

pkgname='gorgeous'
pkgver='1.4.0'
pkgrel=1
pkgdesc='CLI RSS feed reader'
url='https://git.dtluna.net/dtluna/gorgeous'
arch=('any')
license=('custom:WTFPL')

depends=()
makedepends=('go')
optdepends=()

conflicts=('gorgeous-bin')

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e1d41ce1e63c0ec7d6b58721b8e9defd521d864f5f4ddf363a0f6d6248866f1b')

build() {
    cd $srcdir/$pkgname
    go build -o $pkgname
}

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
