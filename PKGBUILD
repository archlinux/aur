# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=git-lfs
pkgver=0.5.1
pkgrel=2
pkgdesc="An open source Git extension for versioning large files"
arch=('i686' 'x86_64')
url="https://git-lfs.github.com/"
license=('MIT')
depends=('git')
install=git-lfs.install

if [[ $CARCH == 'x86_64' ]]; then
  source=(https://github.com/github/git-lfs/releases/download/v$pkgver-tracing/git-lfs-linux-amd64-$pkgver.tar.gz)
  md5sums=('0884e47f605d6aa4e75578cb5852ceaf')
else
  source=(https://github.com/github/git-lfs/releases/download/v$pkgver-tracing/git-lfs-linux-386-$pkgver.tar.gz)
  md5sums=('cbf89f17e9466a9dd420872926d42d1f')
fi

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 git-lfs "$pkgdir"/usr/bin/git-lfs
}
