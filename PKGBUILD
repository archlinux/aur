
# Maintainer : Zenn <mine.minefis@gmail.com>

pkgname=fortune-mod-mlp-crystalsplitter
_gitname=ponysay-modern
_gitrepo=https://github.com/CrystalSplitter/ponysay-modern.git
pkgver=3.0.3.36.82db8cf0
pkgrel=1
pkgdesc="Fortune quotes from My Little Pony Friendship is Magic. Quotes come from ponysay. (CrystalSplitter fork)"
arch=('any')
license=('GPL3')
url='https://github.com/CrystalSplitter/ponysay-modern'
depends=('fortune-mod')
source=("git+${_gitrepo}")
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
    printf "3.0.3.36.%s" $(git rev-parse --short HEAD)
}

build()
{
	cd "${srcdir}/${_gitname}"
	cd extras/fortune-mod-mlp
	chmod u+x name-pony.sh
	make
}

package()
{
    cd "${srcdir}/${_gitname}/extras/fortune-mod-mlp"
	install -dm755 ${pkgdir}/usr/share/fortune
	install -m755 pony* ${pkgdir}/usr/share/fortune
}

