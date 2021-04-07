# Maintainer: Lasha Kanteladze <kanteladzelasha339@gmail.com>
pkgname=dxhd-bin
pkgver=05.04.2021_02.38
pkgrel=0
pkgdesc="An X11 Hotkey Daemon"
arch=('x86_64')
url="https://github.com/dakyskye/dxhd"
depends=('util-linux')
provides=('dxhd')
conflicts=('dxhd-git')
source=("https://github.com/dakyskye/dxhd/releases/download/$pkgver/dxhd_amd64" "https://raw.githubusercontent.com/dakyskye/dxhd/master/LICENSE" "https://raw.githubusercontent.com/dakyskye/dxhd/master/systemd/dxhd.service")
md5sums=('SKIP' 'SKIP' 'SKIP')


package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%????}/LICENSE"
	install -Dm755 dxhd_amd64 "${pkgdir}/usr/bin/dxhd"
	test -d /usr/lib/systemd/user \
		&& install -Dm644 dxhd.service /usr/lib/systemd/user/ \
		|| true
}
