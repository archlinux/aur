# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Kiril Zyapkov <kikcho@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau gmail com>

pkgname=lightyears
pkgver=1.4
pkgrel=2
pkgdesc="A single-player real-time strategy game with a science-fiction theme."
arch=('any')
url="http://www.jwhitham.org/20kly"
license="GPL"
depends=('python2-pygame')
source=(http://www.jwhitham.org/20kly/$pkgname-$pkgver.tar.bz2
        lightyears.desktop)
md5sums=('1211f6c9f368e3d8053965b3e42dcdcd' 
         '7775f7aa7790999139d12c94bb31e244')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a $srcdir/$pkgname-$pkgver/* "$pkgdir/usr/share/$pkgname"
  echo -e "#!/bin/bash\ncd /usr/share/lightyears/\nexec python2 lightyears" > "$pkgdir/usr/bin/$pkgname"
  chmod 755 "$pkgdir/usr/bin/$pkgname"
  install -D -m 644 "$srcdir/lightyears.desktop" "$pkgdir/usr/share/applications/lightyears.desktop"
}

