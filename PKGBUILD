# Maintainer: Dylan Ferris <dylan@kanux.org>
pkgname=yii
pkgver=1.1.16
pkgrel=1
pkgdesc='A high-performance component-based PHP framework best for Web 2.0 development.'
arch=('any')
url='http://www.yiiframework.com/'
license=('BSD')
depends=('php')
options=(!strip)
optdepends=(
'php-sqlite: using SQLite database'
'php-pgsql: using PostgreSQL database'
'php-memcache: Memcache support'
'php-apc: APC support'
'php-mcrypt: required by encrypt and decrypt methods'
'php-gd: GD support'
'yii-docs: developer documentation'
)
install='yii.install'
source=("https://github.com/yiisoft/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('5603b0cb73eeb26f39a4bc029e7c469422facb96bdf78943aecbdd5b019e5095')

package() {
	_instdir=/usr/share/webapps/$pkgname
	cd $srcdir/$pkgname-$pkgver/framework
	install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	mkdir -p $pkgdir/${_instdir}
	cp -r . $pkgdir/${_instdir}
	install -d $pkgdir/usr/bin/
	ln -s ${_instdir}/yiic $pkgdir/usr/bin/yiic
}

# vim:set ts=2 sw=2 et:
