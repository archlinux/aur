# Maintainer: Nathaniel Maia <natemaia10@gmail.com>
# Contributor: Marcus Shaetzle
# Contributor: Eric Vidal <eric@obarun.org>

pkgname=kickshaw
pkgver=0.7.3
pkgrel=1
pkgdesc='A menu editor for freedesktop standard menus'
url='https://bitbucket.org/natemaia/kickshaw'
arch=('x86_64')
sha256sums=('SKIP')
license=('GPL2')
source=("git+$url.git")
makedepends=('gtk3' 'gcc')
depends=('gtk3')

build()
{
	cd kickshaw/source || exit 1
	make
}

package()
{
	install -Dm755 kickshaw/source/kickshaw $pkgdir/usr/bin/kickshaw
	install -Dm644 kickshaw/source/kickshaw.desktop $pkgdir/usr/share/applications/kickshaw.desktop
	install -Dm644 kickshaw/README.md $pkgdir/usr/share/licenses/kickshaw/README.md
	install -Dm644 kickshaw/COPYING $pkgdir/usr/share/licenses/kickshaw/COPYING
}
