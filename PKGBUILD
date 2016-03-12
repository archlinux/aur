# Maintainer: Chrysostomus @forum.manjaro.org

pkgname=pacli
pkgver=0.8
pkgrel=1
pkgdesc="An interactive pacman interface using fzf"
arch=(any)
url="https://github.com/Manjaro-Pek/$pkgname"
license=(GPL2)
depends=('fzf'
	'pacman'
	'yaourt'
	'pacman-mirrorlist'
	'sudo'
	'gzip'
	'downgrade'
	'bash')
makedepends=('git')
optdepends=('update-notifier: Automatically get notified when updates are available')
source=("git://github.com/Manjaro-Pek/$pkgname")
md5sums=('SKIP')

package () {
    install -Dm755 "$srcdir/$pkgname/pacli" "$pkgdir/usr/bin/pacli"
    install -dm755 "${pkgdir}/etc/pacman.d/"
    cp -r "$srcdir/$pkgname/pacman.d" "$pkgdir/etc/"
    chmod 754 "$pkgdir/etc/pacman.d/hooks.bin/pacli-description.sh"
    install -Dm544 "$srcdir/$pkgname/pacli.help" "$pkgdir/usr/share/doc/pacli/help"
}