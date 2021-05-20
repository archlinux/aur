# Maintainer: Silvio Knizek (killermoehre) <killermoehre@gmx.net>

pkgname=ca-certificates-sap
pkgver=20210520
pkgrel=1
pkgdesc="SAP root certificates"
arch=(any)
url="http://www.pki.co.sap.com/"
license=('custom')
depends=(ca-certificates-utils)
source=('http://aia.pki.co.sap.com/aia/SAP%20Global%20Root%20CA.crt'
        'http://aia.pki.co.sap.com/aia/SAP%20Global%20Sub%20CA%2002.crt'
        'http://aia.pki.co.sap.com/aia/SAP%20Global%20Sub%20CA%2004.crt'
        'http://aia.pki.co.sap.com/aia/SAP%20Global%20Sub%20CA%2005.crt'
        'http://aia.pki.co.sap.com/aia/SAPNetCA_G2.crt'
        'http://aia.pki.co.sap.com/aia/SAP%20Cloud%20Root%20CA.crt'
	'http://aia.pki.co.sap.com/aia/SAPPassportG2.crt'
	'http://aia.pki.co.sap.com/aia/SAP%20SSO%20CA%20G2.crt')
sha256sums=('840ce93e2c8e3e15ff9c48b360fa87ac726f1eb6d25cb1fc2711739515bac139'
            'b952c525dd35d9bca412e0c63d6db9442c2ee20924da701945ede90ea3015eed'
            '08729c99a56a9ac97bb938f7426cba70b2be54eb0536f0007743865af31b41e3'
            '36b2e24f6f3125183624e2692be4a6a3d26facadde5f52c945a214f73c625239'
            '4d758d9bb4422960d22d32b81ce333a0d8a6652d7008b0bcf7374d6a81346a35'
            'a509fb321338deb58c4c6c5ebc7d665ea3df148a558da33fbecafccca7e80b6b'
            '9d203d2ae99b3a06b69e59d1633b11d2c3b624ee5f1def15b35ab478d46797e1'
            'f69fb1d56da4bc4e701d443ad195a6a4693a14a22ec0080642b6119be8189bac')

package() {
  local _certdir="$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -d "$_certdir"
  install -t "$_certdir" -m644 ./*.crt
}
