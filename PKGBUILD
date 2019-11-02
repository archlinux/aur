pkgname=ca-certificates-blacklist-startcom
pkgver=3.30.1
pkgrel=1
pkgdesc="A set of broken CAs' certificates which should not be trusted (StartCom only)"
arch=(any)
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
license=('MPL' 'GPL')
depends=('ca-certificates-utils')
sha256sums=('1726484c43f1d0835afaddb1531b181009e18b01a667f41af10e793d64c08187'
			'6710ef0321654c96af73dd7003cba07d72af4f07391fa20102a0e896b33087a9'
			'cf0700f60c9b55a26f053755cb249a34101a0e41212d7da0ff506d8feb49b483')
source=("StartCom_Certification_Authority_G2:2.1.59.crt"
		"StartCom_Certification_Authority:2.1.45.crt"
		"StartCom_Certification_Authority:2.1.1.crt")

package() {
	for cert in ${source[*]}
	do
		install -D -m 644 "${cert}" "${pkgdir}/usr/share/ca-certificates/trust-source/blacklist/${cert}"
	done
}

