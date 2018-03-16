# Maintainer: Bjoern Franke  <bjo@nord-west.org>

pkgbase=dnssec-reverb
pkgname=${pkgbase}-git
pkgver=r13.376067d
pkgrel=1
pkgdesc="Shell script based DNSSEC key management tool"
arch=('any')
url="https://github.com/northox/dnssec-reverb"
license=('Simplified BSD')
optdepends=('dnssec-tools: DNSSEC tools for BIND'
	    'ldns: tools for NSD')
source=("${pkgbase}::git+https://github.com/northox/${pkgbase}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "${srcdir}/${pkgbase}"
 install -D dnssec-reverb "${pkgdir}/usr/bin/dnssec-reverb"
 install -d "${pkgdir}/etc/"
 install -D -m644 *.conf* "${pkgdir}/etc/" 
}

