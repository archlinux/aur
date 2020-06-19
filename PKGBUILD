#Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=privateer_wcu-git
_pkgname=privateer_wcu-git
pkgver=rev.103
pkgrel=1
pkgdesc="VegaStrike-based Privateer: Wing Commander Universe mod. Uses Privateer: Parallel Universe as its base"
arch=('any')
url="https://github.com/pwcu/privateer_wcu"
license=('GPL')
depends=('expat' 'vegastrike-engine')
optdepends=('')
makedepends=('git' 'cmake')
provides=('privateer')
conflicts=('privateer')
#install=$pkgname.install
#options=(!makeflags debug !strip)

source=('git+https://github.com/pwcu/privateer_wcu.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}"/privateer_wcu
  echo "rev.$(git rev-list --count HEAD)"
}

prepare(){
#Only needed until it becomes part of the source
cd ..
chmod a+x {priv,privsettings}
}


build(){
echo "Build not necessary"
}

package() {
mkdir -p "${pkgdir}"/usr/share/privateer_wcu
cp -va "${srcdir}"/privateer_wcu/ "${pkgdir}"/usr/share/

mkdir -p "${pkgdir}"/usr/bin
cd ..
cp -va {priv,privsettings} "${pkgdir}"/usr/bin
chmod a-x {priv,privsettings}
}
