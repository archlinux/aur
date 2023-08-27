# Maintainer: Bryn Edwards <bryn.edwards@protonmail.com>
pkgname=zplug
pkgver=2.4.2
pkgrel=1
pkgdesc="A next-generation plugin manager for zsh"
arch=('any')
url="https://github.com/$pkgname/$pkgname"
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('79d6b16345d22f83faad6164e5ad968713a8dcda')
license=('MIT')
depends=('git' 'zsh' 'awk')
conflicts=('mawk' 'mawk-git')
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
