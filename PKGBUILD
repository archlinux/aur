# Maintainer: Herald Yu <yuhr123@gmail.com>
pkgname=juicefs-bin
_pkgname=juicefs
pkgver=1.0.4
_pkgver=$(echo $pkgver | sed -E 's/^([0-9\.]+)([^0-9].*)?$/\1-\2/' | sed -E 's/-$//')
pkgrel=1
pkgdesc="A distributed POSIX file system built on top of Redis and S3. Community Edition"
arch=('x86_64')
url="https://github.com/juicedata/juicefs"
license=('Apache')
conflicts=('juicefs')
source=("juicefs-$_pkgver.tar.gz::https://github.com/juicedata/juicefs/releases/download/v$_pkgver/juicefs-$_pkgver-linux-amd64.tar.gz")
sha256sums=('8b1b6548e3447ae29def7c57a29f56d363bdfa8ec7dbb38120a3072a53e018ec')

package() {
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  ln -s /usr/bin/$_pkgname "$pkgdir"/usr/bin/mount.$_pkgname
}
