# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Daniel Sandman <revoltism@gmail.com>

pkgname=cnijfilter-mg2500series
pkgver=4.00
pkgrel=2
pkgdesc="Canon IJ Printer Driver (for mg2500 series)"
arch=('i686' 'x86_64')
url="http://support-ph.canon-asia.com/contents/PH/EN/0100550101.html"
license=('unknown')
depends=('cups' 'popt' 'libxml2' 'gtk2' 'libtiff' 'libpng' 'cnijfilter-common-mg2500')
source=('http://gdlp01.c-wss.com/gds/1/0100005501/01/cnijfilter-mg2500series-4.00-1-rpm.tar.gz')
md5sums=('37fd638ae176fad74fd656f6cb719ead')

build() {
  if [ "${CARCH}" = 'x86_64' ]; then
    rpmfile=$(find "$srcdir" -name "cnijfilter-mg2500series-$pkgver*${CARCH}*.rpm")
  elif [ "${CARCH}" = 'i686' ]; then
    rpmfile=$(find "$srcdir" -name "cnijfilter-mg2500series-$pkgver*i386*.rpm")
  fi

  bsdtar -xf $rpmfile
  find . -type f -exec mv --backup=numbered -t . {} +

}

package() {
  cd ${srcdir} 

	install -Dm644 canonmg2500.ppd "${pkgdir}/usr/share/cups/model/canonmg2500.ppd"

	install -Dm644 cifmg2500 "${pkgdir}/usr/bin/cifmg2500"

	install -Dm644 cifmg2500.conf "${pkgdir}/usr/lib/bjlib/cifmg2500.conf"
	install -Dm644 cnb_4290.tbl "${pkgdir}/usr/lib/bjlib/cnb_4290.tbl"
	install -Dm644 cnbpname429.tbl "${pkgdir}/usr/lib/bjlib/cnbpname429.tbl"
	install -Dm644 libcnbpcmcm429.so.8.20.1 "${pkgdir}/usr/lib/libcnbpcmcm429.so.8.20.1"
	install -Dm644 libcnbpcnclapi429.so.4.0.0 "${pkgdir}/usr/lib/libcnbpcnclapi429.so.4.0.0"
	install -Dm644 libcnbpcnclbjcmd429.so.3.3.0 "${pkgdir}/usr/lib/libcnbpcnclbjcmd429.so.3.3.0"
	install -Dm644 libcnbpcnclui429.so.4.0.0 "${pkgdir}/usr/lib/libcnbpcnclui429.so.4.0.0"
	install -Dm644 libcnbpess429.so.4.3.1 "${pkgdir}/usr/lib/libcnbpess429.so.4.3.1"
	install -Dm644 libcnbpo429.so.1.0.1 "${pkgdir}/usr/lib/libcnbpo429.so.1.0.1"

	install -Dm644 LICENSE-cnijfilter-4.00FR.txt "${pkgdir}/usr/share/doc/cnijfilter-mg2500series-4.00/LICENSE-cnijfilter-4.00FR.txt"
	install -Dm644 LICENSE-cnijfilter-4.00SC.txt "${pkgdir}/usr/share/doc/cnijfilter-mg2500series-4.00/LICENSE-cnijfilter-4.00SC.txt"
	install -Dm644 LICENSE-cnijfilter-4.00EN.txt "${pkgdir}/usr/share/doc/cnijfilter-mg2500series-4.00/LICENSE-cnijfilter-4.00EN.txt"
	install -Dm644 LICENSE-cnijfilter-4.00JP.txt "${pkgdir}/usr/share/doc/cnijfilter-mg2500series-4.00/LICENSE-cnijfilter-4.00JP.txt"

	install -Dm644 lproptions-mg2500-4.00EN.txt "${pkgdir}/usr/share/doc/cnijfilter-mg2500series-4.00/lproptions-mg2500-4.00EN.txt"
	install -Dm644 lproptions-mg2500-4.00FR.txt "${pkgdir}/usr/share/doc/cnijfilter-mg2500series-4.00/lproptions-mg2500-4.00FR.txt"
	install -Dm644 lproptions-mg2500-4.00JP.txt "${pkgdir}/usr/share/doc/cnijfilter-mg2500series-4.00/lproptions-mg2500-4.00JP.txt"
	install -Dm644 lproptions-mg2500-4.00SC.txt "${pkgdir}/usr/share/doc/cnijfilter-mg2500series-4.00/lproptions-mg2500-4.00SC.txt"

}
