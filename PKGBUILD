# Maintainer: redfish <redfish@galactica.pw>

pkgname=stemns
_name=StemNS
_commit=68d437491c0308545e149181768cd98e45c1ac82
_height=33
pkgver=0.0.0.r${_height}.g${_commit:0:6}
pkgrel=1

pkgdesc='Tor plugin for resolving names using Stem'
url='https://github.com/namecoin/StemNS'
arch=(x86_64 armv7h)
license=(Unlicense BSD)

depends=('python-stem')
optdepends=(
	'tor: anonymizing overlay network'
)
makedepends=()
install=stemns.install
backup=("etc/stemns.conf")

source=($pkgname-${_commit}.tar.gz::https://github.com/namecoin/StemNS/archive/${_commit}.tar.gz
	stemns.conf)

package() {
  cd $srcdir/$_name-$_commit
  install -Dm 644 -t "$pkgdir/opt/$pkgname" *.py
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm 644  "$srcdir"/stemns.conf "$pkgdir/etc/stemns.conf"
}

sha512sums=('74fbab5a741a77ab13419620a970ce75517bbf81392bdac2fb174ab6547ae7ce624d9112d533bf1d48a8af0abb5926606f4fe2ce3ecccd551aad8d37d0324cf2'
            'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e')
