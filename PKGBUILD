# Maintainer: mpsijm
pkgname=git-xet-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="git-xet client, a Git extension for interacting with XetHub repositories"
arch=('x86_64')
url="https://xethub.com"
license=('BSD')  # I think, based on https://github.com/xetdata/pyxet
depends=('git')
provides=("git-xet=$pkgver")
conflicts=("git-xet")
source=("https://github.com/xetdata/xet-tools/releases/download/v$pkgver/xet-linux-x86_64.deb")
sha256sums=('4fffd0601b5f1baa96a46a7b9a2349f769b70a4564e5ceb5e8de4d9f1fa1b565')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  mkdir "$pkgdir/usr/bin"
  mv "$pkgdir/usr/local/bin/git-xet" "$pkgdir/usr/bin/git-xet"
}
