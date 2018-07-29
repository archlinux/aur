# Maintainer: deadhead <deadhead3492@gmail.com>
pkgname=fetchmirrors
pkgver=0.6
pkgrel=2
pkgdesc="Fetch and rank new pacman mirrorlist"
arch=('any')
url="https://github.com/deadhead420/fetchmirrors"
license=('GPL')
depends=('curl')
source=('https://raw.githubusercontent.com/deadhead420/fetchmirrors/master/fetchmirrors.sh'
        'https://raw.githubusercontent.com/deadhead420/fetchmirrors/master/rankmirrors.sh')
md5sums=('d2996d8b1febfeaaf6d6a8eeaa78f2a8'
         '7fc2d6bef78c48deb4c5c32726e0ea88')

package() {
  cd "${srcdir}"
  install -Dm755 fetchmirrors.sh $pkgdir/usr/bin/fetchmirrors
  if [ ! -f /usr/bin/rankmirrors ]; then
    install -Dm755 rankmirrors.sh $pkgdir/usr/bin/rankmirrors
  fi
}

# vim:set ts=2 sw=2 et:
