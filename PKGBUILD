# Contributor: jose1711 <jose1711@gmail.com>
pkgname=openredalert_full_version_data
pkgver=1
pkgrel=1
pkgdesc="Data files for OpenRedAlert from full version of the game (Soviet/Allied Disc)"
arch=('i686')
url="http://www.ea.com/redalert/news-detail.jsp?id=62"
license=('EULA')
install=('openredalert_data.install')
depends=('openredalert_bin')
makedepends=('unrar' 'uniso')
source=("http://na.llnet.cnc3tv.ea.com/u/f/eagames/cnc3/cnc3tv/RedAlert/RedAlert1_SovietDisc.rar"
"http://na.llnet.cnc3tv.ea.com/u/f/eagames/cnc3/cnc3tv/RedAlert/RedAlert1_AlliedDisc.rar")
md5sums=('0035bad1775dfe3a7cf4de807b41a135'
'0a528b4d12d01b9076c16687ebf821b0')

build() {
	cd ${srcdir}
	unrar x RedAlert1_SovietDisc.rar
	cd ${srcdir}/RedAlert1_SovietDisc/RedAlert1_SovietDisc
	isoinfo -l -R -i CD2_SOVIET_DISC.ISO -l | uniso -R -i CD2_SOVIET_DISC.ISO
	install -D -m 644 'INSTALL/REDALERT.MIX;1' ${pkgdir}/usr/share/openredalert/data/mix/REDALERT-SovietAlliedDisc.mix
	install -D -m 644 'MAIN.MIX;1' ${pkgdir}/usr/share/openredalert/data/mix/MAIN-SovietDisc.mix
	install -D -m 644 'Copy of EA Product EULA RedAlert1.rtf' ${pkgdir}/usr/share/openredalert/data/mix/EA_Product_EULA_RedAlert1.rtf
	cd ${srcdir}
	unrar x RedAlert1_AlliedDisc.rar
	cd ${srcdir}/RedAlert1_AlliedDisc/RedAlert1_AlliedDisc
	isoinfo -l -R -i CD1_ALLIED_DISC.ISO | uniso -R -i CD1_ALLIED_DISC.ISO
	install -D -m 644 'MAIN.MIX;1' ${pkgdir}/usr/share/openredalert/data/mix/MAIN-AlliedDisc.mix
	}
