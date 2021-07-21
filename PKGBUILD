# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Bradley Nelson <bradleynelson102@gmail.com>
pkgname=system-bridge-bin
gitname=system-bridge
pkgver=v2.2.1
pkgrel=1
pkgdesc="A bridge for your systems"
arch=('any')
url="https://system-bridge.timmo.dev/"
license=('MIT')
groups=()
depends=()
makedepends=() # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-bin}")
conflicts=("system-bridge" "system-bridge-git")
replaces=()
backup=()
options=()
install=
source=("https://github.com/timmo001/system-bridge/releases/download/${pkgver}/linux-out.tar.gz" system-bridge.desktop)
noextract=()
md5sums=('edf1674ee7476cad173e07d16c0c5490' '3f8b60172f0a2d5699767b1baac8e670')

package() {
	cd "$srcdir/linux-out"
	mkdir -p "${pkgdir}"/usr/local/share/system-bridge


	install -Dm755 ./LICENSE "${pkgdir}"/usr/share/licenses/system-bridge/LICENSE
	install -Dm755 ./system-bridge "${pkgdir}"/usr/local/share/system-bridge/system-bridge
	install -Dm755 ./system-bridge-circle.ico "${pkgdir}"/usr/local/share/system-bridge/system-bridge-circle.ico
	install -Dm755 ./system-bridge-circle.png "${pkgdir}"/usr/local/share/system-bridge/system-bridge-circle.png
	install -Dm755 ./system-bridge-tray "${pkgdir}"/usr/local/share/system-bridge/system-bridge-tray
	install -Dm755 ./xdg-open "${pkgdir}"/usr/local/share/system-bridge/xdg-open
	install -Dm755 ./traybin/tray_linux_release "${pkgdir}"/usr/local/share/system-bridge/traybin/tray_linux_release
	install -Dm755 $srcdir/system-bridge.desktop $pkgdir/usr/share/applications/system-bridge.desktop 
}

# check() {
# 	cd "$srcdir/${pkgname%-git}"
# 	yarn test
# }
