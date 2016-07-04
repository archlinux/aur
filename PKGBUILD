# Maintainer: Alexander Agura <agur4ik09@gmail.com>
pkgname=find-the-command
pkgver=1.1
pkgrel=1
pkgdesc="Interactive command-not-found hook for bash and zsh using the power of pacman"
arch=('any')
url="https://github.com/agur4ik/find-the-command"
license=('custom:WTFPL')
depends=('pacman>=5.0')
optdepends=('zsh: cool interactive shell with plenty of features')
backup=('usr/lib/systemd/system/pacman-files.service'
		'usr/lib/systemd/system/pacman-files.timer')
install=find-the-command.install
source=("https://github.com/agur4ik/$pkgname/archive/$pkgver.tar.gz")
md5sums=(360a2ccb5fefe528f19ce90b9c619c66)

package() {
	cd "$pkgname-$pkgver"
	rm .gitignore
	mkdir -p usr/share/licenses/$pkgname
	mv LICENSE usr/share/licenses/$pkgname/
	mv README.md usr/share/doc/$pkgname/
	cp -a * $pkgdir/
}
