# Maintainer: Shulhan <m.shulhan at gmail.com>

pkgname='hunspell-id'
pkgver=2.2
pkgdesc="Indonesian hunspell dictionary"
pkgrel=1
arch=('any')
url="https://github.com/shuLhan/hunspell-id"
license=('LGPL3')

makedepends=("git") 
source=("git+https://github.com/shuLhan/hunspell-id.git")
sha256sums=('SKIP')

package() {
	cd $pkgname

	git reset --hard "v${pkgver}"

	install -dm755 ${pkgdir}/usr/share/hunspell/
	install -m644 id_ID.dic id_ID.aff $pkgdir/usr/share/hunspell/

	install -dm755 ${pkgdir}/usr/share/myspell/dicts/
	pushd ${pkgdir}/usr/share/myspell/dicts/
	ln -sv /usr/share/hunspell/id_ID.dic
	ln -sv /usr/share/hunspell/id_ID.aff
	popd
}
