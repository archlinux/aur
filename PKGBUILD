# Maintainer: Alexander Agura <agur4ik09@gmail.com>
pkgname=find-the-command
pkgver=1.4
pkgrel=1
pkgdesc="Advanced command-not-found hook for bash and zsh using the power of pacman"
arch=('any')
url="https://github.com/agura-lex/find-the-command"
license=('custom:WTFPL')
depends=('pacman>=5.0')
optdepends=('zsh: cool interactive shell with plenty of features'
            'sudo: for root access (needed for packages installation)')
backup=('usr/lib/systemd/system/pacman-files.service'
        'usr/lib/systemd/system/pacman-files.timer')
install=find-the-command.install
source=("https://github.com/agura-lex/$pkgname/archive/$pkgver.tar.gz")
md5sums=('03257191fdd5cb93ba2bb8115640847d')

package() {
	cd "$pkgname-$pkgver"
	rm .gitignore
	mkdir -p usr/share/licenses/$pkgname
	mv LICENSE usr/share/licenses/$pkgname/
	mv README.md usr/share/doc/$pkgname/
	cp -a * $pkgdir/
}
