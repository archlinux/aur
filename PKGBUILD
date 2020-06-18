#Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=privateergold
_pkgname=privateergold
pkgver=1.03
pkgrel=1
pkgdesc="Remake of the Wing Commander Privateer using the Vegastrike engine"
arch=('any')
url="privateer.sourceforge.net"
license=('GPL')
depends=('vegastrike-engine')
optdepends=('')
makedepends=('git' 'cmake')
provides=('privateergold')
conflicts=('privateergold')
#install=$pkgname.install
#options=(!makeflags debug !strip)

source=('http://prdownloads.sourceforge.net/privateer/PrivateerGold1.03.bz2.bin?download')
sha1sums=('SKIP')

#pkgver() {
#  cd "${srcdir}"/Assets-Production
#  echo "rev.$(git rev-list --count HEAD)"
#}

prepare(){
cd ..
chmod a+x ./PrivateerGold1.03.bz2.bin?download
chmod a+x ./priv
chmod a+x ./privsettings
}


build(){
  echo "No build necessary"
}

package() {
cd ..
./PrivateerGold1.03.bz2.bin\?download --target "${pkgdir}"/usr/share/privgold100 --noexec
mkdir -p "${pkgdir}"/usr/bin/
cp -va priv "${pkgdir}"/usr/bin/
cp -va privsettings "${pkgdir}"/usr/bin
chmod a-x ./PrivateerGold1.03.bz2.bin?download
chmod a-x ./priv
chmod a-x ./privsettings
}

