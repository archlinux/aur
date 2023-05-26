# Maintainer: Marcus Schaetzle <kickshaw22@gmail.com>
# Contributor: Nathaniel Maia <natemaia10@gmail.com>
# Contributor: Eric Vidal <eric@obarun.org>

pkgname=kickshaw
pkgver=1.1.5
pkgrel=1
pkgdesc='A menu editor for freedesktop standard menus'
url='http://download.savannah.gnu.org/releases/obladi'
arch=('x86_64')
sha256sums=('SKIP')
license=('GPL2')
source=("${url}/${pkgname}_${pkgver}_GTK3_source_only.tar.bz2")
makedepends=('gtk3' 'gcc')
depends=('gtk3')

build()
{
	cd ${pkgname}_${pkgver}_GTK3_source_only/source || exit 1
	make
}

package()
{
	install -Dm755 ${pkgname}_${pkgver}_GTK3_source_only/source/kickshaw $pkgdir/usr/bin/kickshaw
	install -Dm644 ${pkgname}_${pkgver}_GTK3_source_only/README $pkgdir/usr/share/licenses/kickshaw/README
	install -Dm644 ${pkgname}_${pkgver}_GTK3_source_only/COPYING $pkgdir/usr/share/licenses/kickshaw/COPYING

	install -d "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/de" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/es" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/fr" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/it" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/pt" "$pkgdir/usr/share/locale"
}
