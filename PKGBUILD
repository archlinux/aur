# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=xfce-config-helper
pkgver=1.1
pkgrel=1
pkgdesc='Tools to help manage Xfce configurations'
depends=('ruby' 'ruby-dbus')
url="https://github.com/felipec/$pkgname"
arch=('any')
license=('ISC')
makedepends=('git')
source=("${url}/archive/v${pkgver}.tar.gz" 'defaults.patch')
sha1sums=('6874ffecf25eafe72c531e919c4d2f65fd857a86'
	  'deca13c7d6d184dad73cab08abce96386978dd6e')

package() {
	cd "$pkgname-$pkgver" || exit 1

	patch -p1 -i "$srcdir/defaults.patch"

	DESTDIR="$pkgdir/" make prefix=/usr install
}
