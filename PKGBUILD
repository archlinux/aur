# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=git-lfs
pkgver=0.5.4
pkgrel=1
pkgdesc="An open source Git extension for versioning large files"
arch=('i686' 'x86_64')
url="https://git-lfs.github.com/"
license=('MIT')
depends=('git')
install=git-lfs.install

if [[ $CARCH == 'x86_64' ]]; then
  source=(https://github.com/github/git-lfs/releases/download/v$pkgver/git-lfs-linux-amd64-$pkgver.tar.gz)
  md5sums=('bc5c94d850cda8743139ae707d6eb06a')
else
  source=(https://github.com/github/git-lfs/releases/download/v$pkgver/git-lfs-linux-386-$pkgver.tar.gz)
  md5sums=('aa6c5143d9c610a7429862dc0322ea89')
fi

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 git-lfs "$pkgdir"/usr/bin/git-lfs
}
