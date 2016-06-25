# Maintainer: Bryn Edwards <bryn at openmailbox dot org>
pkgname=zplug
pkgver=2.1.0
pkgrel=2
pkgdesc="A next-generation plugin manager for zsh"
arch=('any')
url="http://zplug.sh"
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('8ba1890003b31e84debe11f4ea6c79d850b8a2c0')
license=('MIT')
depends=('git' 'zsh')
install='zplug.install'

package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/zsh/scripts/$pkgname/
    cp -R ./{autoload,base,bin,init.zsh,misc,zplug} $pkgdir/usr/share/zsh/scripts/$pkgname/

    mkdir -p $pkgdir/usr/share/man
    cp -R ./doc/man/* $pkgdir/usr/share/man/

    mkdir -p $pkgdir/usr/share/licenses/zplug/
    cp -R ./doc/LICENSE-MIT.txt $pkgdir/usr/share/licenses/zplug/
}
