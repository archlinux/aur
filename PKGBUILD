# Maintainer: Bryn Edwards <bryn at openmailbox dot org>
pkgname=zplug
pkgver=2.3.4
pkgrel=1
pkgdesc="A next-generation plugin manager for zsh"
arch=('any')
url="http://zplug.sh"
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('1fd5314c7ff02854688c5767045b4bed2dcbe1b9')
license=('MIT')
depends=('git' 'zsh')
install='zplug.install'

package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/zsh/scripts/$pkgname/
    cp -R ./{autoload,base,bin,init.zsh,misc} $pkgdir/usr/share/zsh/scripts/$pkgname/

    mkdir -p $pkgdir/usr/share/man
    cp -R ./doc/man/* $pkgdir/usr/share/man/

    mkdir -p $pkgdir/usr/share/licenses/zplug/
    cp -R ./doc/LICENSE-MIT.txt $pkgdir/usr/share/licenses/zplug/
}
