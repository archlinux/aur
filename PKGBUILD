# Maintainer: dtluna <dtluna at waifu dot club>

pkgname='htmltui'
pkgver='1.1.0'
pkgrel=1
pkgdesc='A terminal UI utility to view HTML'
url='https://git.dtluna.net/dtluna/htmltui'
arch=('any')
license=('custom:WTFPL')

depends=()
makedepends=('go')
optdepends=()

conflicts=('htmltui-bin')

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ef795e477d9e07bcc16e72488045698e79aa99bfff9edb3efd0b51de775ee8c9')

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
