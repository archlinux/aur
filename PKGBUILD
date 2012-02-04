# Maintainer: Max Pray a.k.a. Synthead <synthead1@gmail.com>
# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=samdump2
pkgver=2.0.1
pkgrel=2
pkgdesc="Dump password hashes from a Windows NT/2k/XP installation"
arch=('i686' 'x86_64')
url="http://sourceforge.net/project/showfiles.php?group_id=133599&package_id=222150"
license="GPL"
depends=('openssl')
source=("http://downloads.sourceforge.net/ophcrack/$pkgname-$pkgver.tar.bz2"
        'prefix-infos.patch')
md5sums=('d8230e4c1692102d2088b0efcb7438be'
         '9652a003668d4dcf2711e397f5f8ec7f')

build() {
 cd "$srcdir/$pkgname-$pkgver"
 patch -p0 < "$srcdir/prefix-infos.patch"
 make
}

package() {
 cd "$srcdir/$pkgname-$pkgver"
 make install DESTDIR="$pkgdir"
}
