# Maintainer: take100yen <take100yen at gmail dot com>
pkgname=cnijfilter-mg7100
pkgver=4.00
pkgrel=3
pkgdesc="Canon InkJet Printer driver for MG7100 series"
url="https://cweb.canon.jp/drv-upd/ij-mfp/linux-pd-mg7130-400.html"
arch=('x86_64')
license=('custom')
depends=('cnijfilter-common')
source=("http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNTUxMjAx")
md5sums=('83bc4c91e968edb2377767ae049d6741')
package()
{
  local _filedir="${srcdir}/cnijfilter-mg7100series-$pkgver-1-deb/packages"
  cd ${_filedir}
  ar -x "cnijfilter-mg7100series_$pkgver-1_amd64.deb" data.tar.gz
  tar -xzf data.tar.gz
  mkdir -p usr/share/license/${pkgname}
  mv usr/share/doc/cnijfilter-mg7100series/LICENSE-* usr/share/licenses/${pkgname}/
  mv usr/share/doc/cnijfilter-mg7100series/copyright usr/share/licenses/${pkgname}/
  cp "${_filedir}/usr/" "${pkgdir}/usr" -r
}
