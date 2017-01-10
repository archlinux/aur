# Maintainer: Bryn Edwards <bryn at openmailbox dot org>
pkgname=zplug
pkgver=2.4.1
pkgrel=1
pkgdesc="A next-generation plugin manager for zsh"
arch=('any')
url="http://zplug.sh"
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('561be9e9cd8a5f13c7c4cb102aa25a420226013e')
license=('MIT')
depends=('git' 'zsh')
install='zplug.install'

package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/zsh/scripts/$pkgname/
    cp -R ./{autoload,base,bin,init.zsh,misc} $pkgdir/usr/share/zsh/scripts/$pkgname/

    mkdir -p $pkgdir/usr/share/man
    cp -R ./doc/man/* $pkgdir/usr/share/man/

    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    cp ./doc/LICENSE-MIT.txt $pkgdir/usr/share/licenses/$pkgname/
}
