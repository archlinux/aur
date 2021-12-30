# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
pkgname=virustotal
pkgver=1.3
pkgrel=3
pkgdesc='Command-line client for virustotal.com'
arch=('any')
url="https://github.com/shibumi/virustotal"
license=('BSD')
depends=('python2')
source=("${pkgname}-${pkgver}.tar,gz::https://github.com/shibumi/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('90ab565c537765bb6463591bd3635c91f3fceca4fd6450883250551275f818132287e08e6d05617a838da7f6fa353cf09ae9f4e593d4a1f77a45f265ff92cf9c')
backup=('etc/virustotal.conf')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 vt.py "${pkgdir}/usr/bin/virustotal"
  install -D -m644 virustotal.conf "${pkgdir}/etc/virustotal.conf"
}
