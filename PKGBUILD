# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=git-lfs
pkgver=0.5.3
pkgrel=1
pkgdesc="An open source Git extension for versioning large files"
arch=('i686' 'x86_64')
url="https://git-lfs.github.com/"
license=('MIT')
depends=('git')
install=git-lfs.install

if [[ $CARCH == 'x86_64' ]]; then
  source=(https://github.com/github/git-lfs/releases/download/v$pkgver/git-lfs-linux-amd64-$pkgver.tar.gz)
  md5sums=('5252d1dff89e64ddf83bdfb31eaa7bc6')
else
  source=(https://github.com/github/git-lfs/releases/download/v$pkgver/git-lfs-linux-386-$pkgver.tar.gz)
  md5sums=('65509620e8aec41ef672261e9f5b3287')
fi

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 git-lfs "$pkgdir"/usr/bin/git-lfs
}
