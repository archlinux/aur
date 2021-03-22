#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Jamie Quigley <jamie at quigley dot xyz>

pkgname=robin-hood-hashing-git
pkgver=3.11.0
pkgrel=1
# Grab git version : take a look a the top of the src/include/robin_hood.h
pkgdesc='Fast & memory efficient hashtable based on robin hood hashing for C++11/14/17/20'
arch=(any)
url="https://github.com/martinus/robin-hood-hashing"
license=('MIT')
makedepends=('git')
source=("$pkgname::git+https://github.com/martinus/robin-hood-hashing.git")
md5sums=('SKIP')
conflicts=('robin-hood-hashing')
provides=('robin-hood-hashing')

pkgver(){
  cd $srcdir/$pkgname
  echo 3.11.0.$(date -I | sed 's/-/_/' | sed 's/-/_/').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package(){
    cd $srcdir/$pkgname

    install -Dm644 "src/include/robin_hood.h" "$pkgdir/usr/include/robin_hood.h"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
