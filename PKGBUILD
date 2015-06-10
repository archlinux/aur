# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierluigi Picciau <pierluigi.picciau@gmail.com>
# Contributor: NGM <ngm270189 {at} gmail.com>

pkgname=wirouterkeyrec
pkgver=1.1.2
pkgrel=1
pkgdesc="A powerful software to recover the default WPA passphrases (Telecom Italia Alice AGPF, Fastweb Pirelli, Fastweb Tesley, Eircom Netopia, Pirelli TeleTu/Tele 2)"
arch=('i686' 'x86_64')
url="http://www.salvatorefresta.net/tools/"
license=('GPL')
depends=('glibc')
optdepends=('wireless_tools: for wr_iwlist.sh')
source=("http://tools.salvatorefresta.net/WiRouter_KeyRec_$pkgver.zip")
md5sums=('75256f3f82502d3af1eb1d351605b90a')

build() {
  cd WiRouter_KeyRec_$pkgver
  ./configure --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd WiRouter_KeyRec_$pkgver
  make DESTDIR="${pkgdir}" install
}
