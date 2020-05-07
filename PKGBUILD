# Maintainer: Klexx <klexx@mailbox.bz> 

pkgname=("pivx-daemon" "pivx-cli" "pivx-qt")
pkgbase=pivx
_pkgbase=${pkgbase^^}
pkgver=4.1.0
pkgrel=1
arch=("i686" "x86_64")
url="https://pivx.org/"
#depends=("boost-libs")
pkgdesc="Transactional security and privacy-focused decentralized open source cryptocurrency "
license=("MIT")
source=("https://github.com/PIVX-Project/PIVX/archive/v$pkgver.tar.gz")
source_i686=("https://github.com/PIVX-Project/PIVX/releases/download/v$pkgver/pivx-$pkgver-i686-linux-gnu.tar.gz")
source_x86_64=("https://github.com/PIVX-Project/PIVX/releases/download/v$pkgver/pivx-$pkgver-x86_64-linux-gnu.tar.gz")
sha256sums=("1764f0953ecfda0c1fee90219d92f5ac85a134ea28f471ad08f39d64ed504ff4")
sha256sums_i686=("ca311bde3eb861f3fdbdd093e62c8c22dba94d78e53ed2653b3e641b8c818a8b")
sha256sums_x86_64=("df1be58581fc657c7d3f5d0fe0d6d5b2f257d86fbadfaf30ab889410a12d7b28")

package_pivx-daemon() {
  pkgdesc+="(daemon)"
  #depends+=("openssl" "miniupnpc" "db4.8")

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "bin/pivxd"				"${pkgdir}/usr/bin/pivxd"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 "contrib/init/pivxd.service"		"${pkgdir}/usr/lib/systemd/system/pivxd.service"
  install -Dm644 "contrib/debian/examples/pivx.conf"	"${pkgdir}/usr/share/doc/${pkgname}/examples/pivx.conf"
  install -Dm644 "doc/man/pivxd.1"			"${pkgdir}/usr/share/man/man1/pivxd.1"
  #install -Dm644 "contrib/debian/manpages/pivx.conf.5"	"${pkgdir}/usr/share/man/man5/pivx.conf.5"
  install -Dm644 "COPYING"				"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_pivx-cli() {
  pkgdesc+="(CLI)"
  #depends+=("openssl")

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "bin/pivx-cli"				"${pkgdir}/usr/bin/pivx-cli"
  install -Dm755 "bin/pivx-tx"				"${pkgdir}/usr/bin/pivx-tx"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 "COPYING"				"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "doc/man/pivx-cli.1"			"${pkgdir}/usr/share/man/man1/pivx-cli.1"
  install -Dm644 "doc/man/pivx-tx.1"			"${pkgdir}/usr/share/man/man1/pivx-tx.1"
}

package_pivx-qt() {
  pkgdesc+="(Qt)"
  #depends+=("qt5-base" "protobuf" "qrencode" "miniupnpc" "db4.8")

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "bin/pivx-qt"				"${pkgdir}/usr/bin/pivx-qt"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 "contrib/debian/pivx-qt.desktop"	"${pkgdir}/usr/share/applications/pivx.desktop"
  install -Dm644 "share/pixmaps/pivx128.png"		"${pkgdir}/usr/share/pixmaps/pivx128.png"
  install -Dm644 "doc/man/pivx-qt.1"			"${pkgdir}/usr/share/man/man1/pivx-qt.1"
  install -Dm644 "COPYING"				"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
