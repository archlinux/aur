# Maintainer: Silvio Knizek (killermoehre) <killermoehre@gmx.net>

pkgname=ca-certificates-sap
pkgver=20170307
pkgrel=2
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
        'http://aia.pki.co.sap.com/aia/sso_ca.crt')
sha256sums=('840ce93e2c8e3e15ff9c48b360fa87ac726f1eb6d25cb1fc2711739515bac139'
            'b952c525dd35d9bca412e0c63d6db9442c2ee20924da701945ede90ea3015eed'
            '08729c99a56a9ac97bb938f7426cba70b2be54eb0536f0007743865af31b41e3'
            '36b2e24f6f3125183624e2692be4a6a3d26facadde5f52c945a214f73c625239'
            '4d758d9bb4422960d22d32b81ce333a0d8a6652d7008b0bcf7374d6a81346a35'
            'ae547cc4e5d9c5783167d8472435e18ada2bbf89ebe8c6094603dc591ac37aac')

package() {
  local _certdir="$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -d "$_certdir"
  install -t "$_certdir" -m644 ./*.crt
}
