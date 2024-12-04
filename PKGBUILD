# Maintainer: Herald Yu <yuhr123@gmail.com>
pkgname=juicefs-bin
_pkgname=juicefs
pkgver=1.2.2
_pkgver=$(echo $pkgver | sed -E 's/^([0-9\.]+)([^0-9].*)?$/\1-\2/' | sed -E 's/-$//')
pkgrel=1
pkgdesc="A distributed POSIX file system built on top of Redis and S3 (Community Edition)."
arch=('x86_64')
url="https://github.com/juicedata/juicefs"
license=('Apache')
conflicts=('juicefs')
source=("juicefs-$_pkgver.tar.gz::https://github.com/juicedata/juicefs/releases/download/v$_pkgver/juicefs-$_pkgver-linux-amd64.tar.gz")
sha256sums=('6b3503971d65f487920658bed0e098be9223e62d26e643b09a793039ab83be17')

package() {
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  ln -s /usr/bin/$_pkgname "$pkgdir"/usr/bin/mount.$_pkgname
}
