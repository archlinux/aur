# $Id$
# Maintainer: Blackleg <blackleg@openaliasbox.org>

pkgname=ca-certificates-dnie
pkgver=20151002
pkgrel=1
pkgdesc="Spanish DNIE root certificates"
arch=(any)
url="http://www.dnielectronico.es"
license=('unknown')
depends=('ca-certificates-utils' 'ca-certificates-fnmt')
source=('http://www.dnielectronico.es/ZIP/ACRAIZ-SHA2.CAB'
	'http://www.dnielectronico.es/ZIP/ACDNIE001-SHA2.zip'
	'http://www.dnielectronico.es/ZIP/ACDNIE002-SHA2.zip'
	'http://www.dnielectronico.es/ZIP/ACDNIE003-SHA2.zip')
				
sha256sums=('2e84b159b7b4de499e15ff237bb613f447dabd5bf1e92b78fc000ff38917fe18'
            '67386025ca16e1720976d814ff0d3e4060851afeb394e3e5024f059e81aa3104'
            '2426b2291fa92c041956b72d2c313184aae489124d5b1a3c7973ecd07b4af275'
            'a93dd548f9f9501e1dc0f63171943fc9bc6c6adaae0762847120b38535e3c132')

package() {
  local certdir="$pkgdir/usr/share/ca-certificates/trust-source/anchors"
	mkdir -p "$certdir"
  install -t "$certdir" -m644 *.crt
}
