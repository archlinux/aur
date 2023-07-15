_pkgname=sat_code
pkgname=pluto-sat-code-git
pkgver=20230608.3db65bb
pkgrel=1
pkgdesc="Code for the SGP4/SDP4 satellite motion model, and for manipulating TLEs (Two-Line Elements)"
arch=(x86_64)
url="http://www.projectpluto.com/sat_code.htm"
license=(MIT)
makedepends=('git')
source=("git+https://github.com/Bill-Gray/sat_code.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short --abbrev=7 | tr -d -
}

build() {
  cd "$srcdir/${_pkgname}"
  make
}

package() {
  install -m644 -D "${srcdir}/${_pkgname}/libsatell.a"	"$pkgdir/usr/lib/libsatell.a"
  install -m755 -D "${srcdir}/${_pkgname}/dropouts"	"$pkgdir/usr/bin/dropouts"
  install -m755 -D "${srcdir}/${_pkgname}/fake_ast"	"$pkgdir/usr/bin/fake_ast"
  install -m755 -D "${srcdir}/${_pkgname}/fix_tles"	"$pkgdir/usr/bin/fix_tles"
  install -m755 -D "${srcdir}/${_pkgname}/get_high"	"$pkgdir/usr/bin/get_high"
  install -m755 -D "${srcdir}/${_pkgname}/line2"	"$pkgdir/usr/bin/line2"
  install -m755 -D "${srcdir}/${_pkgname}/mergetle"	"$pkgdir/usr/bin/mergetle"
  install -m755 -D "${srcdir}/${_pkgname}/obs_tes2"	"$pkgdir/usr/bin/obs_tes2"
  install -m755 -D "${srcdir}/${_pkgname}/obs_test"	"$pkgdir/usr/bin/obs_test"
  install -m755 -D "${srcdir}/${_pkgname}/out_comp"	"$pkgdir/usr/bin/out_comp"
  install -m755 -D "${srcdir}/${_pkgname}/sat_cgi"	"$pkgdir/usr/bin/sat_cgi"
  install -m755 -D "${srcdir}/${_pkgname}/sat_eph"	"$pkgdir/usr/bin/sat_eph"
  install -m755 -D "${srcdir}/${_pkgname}/sat_id"       "$pkgdir/usr/bin/sat_id"
  install -m755 -D "${srcdir}/${_pkgname}/sat_id2"	"$pkgdir/usr/bin/sat_id2"
  install -m755 -D "${srcdir}/${_pkgname}/summarize"	"$pkgdir/usr/bin/summarize"
  install -m755 -D "${srcdir}/${_pkgname}/test2"	"$pkgdir/usr/bin/test2"
  install -m755 -D "${srcdir}/${_pkgname}/test_des"	"$pkgdir/usr/bin/test_des"
  install -m755 -D "${srcdir}/${_pkgname}/test_out"	"$pkgdir/usr/bin/test_out"
  install -m755 -D "${srcdir}/${_pkgname}/test_sat"	"$pkgdir/usr/bin/test_sat"
  install -m755 -D "${srcdir}/${_pkgname}/tle2mpc"	"$pkgdir/usr/bin/tle2mpc"
}

