# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgbase=mse-mtg-new-other
pkgname=("${pkgbase%%-other}-splits" "${pkgbase%%-other}-miracles" 
         "${pkgbase%%-other}-doublefaced" "${pkgbase%%-other}-levelers" 
         "${pkgbase%%-other}-clear" "${pkgbase%%-other}-textless" 
         "${pkgbase%%-other}-flips" "${pkgbase%%-other}-promos")
pkgver=2.0.0
pkgrel=1
pkgdesc="Magic: the Gathering templates for Magic Set Editor."
arch=(any)
url="http://magicseteditor.sourceforge.net"
license=('freeware')
depends=('magicseteditor')
conflicts=("mse-mtg-phyrexian" "magicseteditor-mtg-base")
source=('http://downloads.sourceforge.net/project/msetemps/Magic%20-%20Printed%20Modern%20Styles.mse-installer')

_package-splits()
{
	depends=('mse-mtg')
	pkgdesc="Magic: the Gathering split cards for Magic Set Editor."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-*-split*.mse-style "$pkgdir/usr/share/magicseteditor/data"
}

_package-miracles()
{
	depends=('mse-mtg')
	pkgdesc="Magic: the Gathering miracles for Magic Set Editor."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-*-miracle.mse-style "$pkgdir/usr/share/magicseteditor/data"
}

_package-doublefaced()
{
	depends=('mse-mtg')
	pkgdesc="Magic: the Gathering double faced cards for Magic Set Editor."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-*-doublefaced.mse-style "$pkgdir/usr/share/magicseteditor/data"
}

_package-levelers()
{
	depends=('mse-mtg')
	pkgdesc="Magic: the Gathering leveler cards for Magic Set Editor."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-new-leveler.mse-style "$pkgdir/usr/share/magicseteditor/data"
}

_package-clear()
{
	depends=('mse-mtg')
	pkgdesc="Magic: the Gathering Modern clear templates for Magic Set Editor."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-new-clear.mse-style "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-new-token-clear.mse-style "$pkgdir/usr/share/magicseteditor/data"
}

_package-flips()
{
	depends=('mse-mtg')
	pkgdesc="Magic: the Gathering flip cards for Magic Set Editor."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-new-flip.mse-style "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-new-curse.mse-style "$pkgdir/usr/share/magicseteditor/data"
}

_package-promos()
{
	depends=('mse-mtg')
	pkgdesc="Magic: the Gathering Modern promos for Magic Set Editor."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-new-promo.mse-style "$pkgdir/usr/share/magicseteditor/data"
}

_package-textless()
{
	depends=('mse-mtg')
	pkgdesc="Magic: the Gathering textless templates for Magic Set Editor."
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-new-textless*.mse-style "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-new-unland.mse-style "$pkgdir/usr/share/magicseteditor/data"
}

# vim:set ts=2 sw=2
md5sums=('ab6108f86b32a8fb3bc285bdc7f1ffcb')

for _p in ${pkgname[@]};do
	eval "package_${_p}() {
		$(declare -f "_package${_p#${pkgbase%%-other}}")
		_package${_p#${pkgbase%%-other}}
		}"
done
