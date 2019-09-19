# Maintainer: Kenneth G. Strawn <kstrawn0@saddleback.edu>

pkgname=triggerlinux-archiso
_pkgname="TriggerLinux"
pkgrel=1
pkgdesc="TriggerLinux build scripts"
arch=("x86_64")
url="https://github.com/realKennyStrawn93/$_pkgname"
if [ ! -d $_pkgname ]; then
  pkgver=$(git clone $url.git &>/dev/null && cd $_pkgname && git rev-list --all | wc -l)
else
  pkgver=$(git rev-list --all $_pkgname | wc -l)
fi
license=("GPL")
depends=("bash")
source=("git+$url.git#branch=master")
md5sums=("SKIP")

package() {
  mkdir -p $pkgdir/opt
  cd $srcdir
  cp -r $_pkgname $pkgdir/opt/triggerlinux-archiso
}
