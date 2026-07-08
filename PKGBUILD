# Maintainer: Herald Yu <yuhr123@gmail.com>
pkgname=juicefs-bin
_pkgname=juicefs
pkgver=1.4.0
_pkgver=$(echo $pkgver | sed -E 's/^([0-9\.]+)([^0-9].*)?$/\1-\2/' | sed -E 's/-$//')
pkgrel=1
pkgdesc="A distributed POSIX file system built on top of Redis and S3 (Community Edition)."
arch=('x86_64')
url="https://github.com/juicedata/juicefs"
license=('Apache')
conflicts=('juicefs')
source=("juicefs-$_pkgver.tar.gz::https://github.com/juicedata/juicefs/releases/download/v$_pkgver/juicefs-$_pkgver-linux-amd64.tar.gz")
sha256sums=('6dedd730487e7dac1b11c5801682a89692f2e6b97890baf7ac943407500b85ab')

package() {
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  ln -s /usr/bin/$_pkgname "$pkgdir"/usr/bin/mount.$_pkgname
}
