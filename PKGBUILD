# Maintainer: WaffleFrisbee <dev@longfam.org>
pkgname=lemurs-openrc
pkgver=1.0
pkgrel=1
pkgdesc="OpenRC script for lemurs a TUI Display/Login Manager"
arch=('x86_64')
url="https://aur.archlinuc.org/lemurs-openrc"
license=('custom:WTFPL')
depends=('lemurs')
optdepends=('openrc: to make use of the OpenRC initscripts.')
source=(
	'lemursd.initd'
	'LICENSE'
	'lemursd.install'
)
sha256sums=('d6336a8a05895b40bd3efdaaf8ba14b6e5f3e31c980e33a24d0bd2c7d25624c4'
            '96f17857f3eb28a7d93dad930bc099a3cb65a9a2afb37069bfd1ba5ec5964389'
            'b370c632e59f8680acb3fdab52172269f359bc9be3fb8093595e0fa4969ba50a')

package() {
	install -Dm755 ${srcdir}/lemursd.initd "$pkgdir"/etc/init.d/lemursd
	install=lemursd.install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
