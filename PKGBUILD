# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='prm'
pkgver=v2.3.0
pkgrel=1
pkgdesc='Pull Request Manager for Maintainers'
url='https://github.com/ldez/prm'
arch=('x86_64')
license=('APACHE')

provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")

depends=(
  'git'
)

makedepends=()

source=("https://github.com/ldez/prm/releases/download/${pkgver}/prm_linux-amd64"
        "https://raw.githubusercontent.com/ldez/prm/master/LICENSE")

sha256sums=("912eeede21e18e1dd7e31179f107cd3eee969ff52f7023a7cb4c5bc168892952"
            "4cc1b9526ac9a5f81b49e804ddeb134b3a70262f6d760c9fb2fb98fb1d6603ba")

package() {
  # Bin
	rm -f "${pkgdir}"/usr/bin/prm
	install -Dm755 "${srcdir}/prm_linux-amd64" "${pkgdir}/usr/bin/prm"

	# License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
