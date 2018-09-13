# Maintainer: Oleksii Vilchanskyi <oleksii.vilchanskyi@gmail.com>

pkgname=pb_cli-git
pkgver=r13.5242382
pkgrel=1
pkgdesc="No bullshit pb client."
arch=('any')
url="https://github.com/ptpb/pb_cli"
license=('unknown')
depends=('curl' 'bash>4' 'jq')
optdepends=('maim: for screenshots'
			'xclip: for clipboard manipulation')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=('pb_cli-git::git+https://github.com/ptpb/pb_cli.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	install -Dm755 src/pb.sh "${pkgdir}/usr/bin/pb"
}
