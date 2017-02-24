# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=git-lfs-bin
_pkgname=${pkgname%-bin}
pkgver=1.5.6
pkgrel=1
pkgdesc="An open source Git extension for versioning large files"
arch=('i686' 'x86_64')
url="https://git-lfs.github.com/"
license=('MIT')
depends=('git')
conflicts=('git-lfs')
provides=('git-lfs')
install=git-lfs.install

if [[ $CARCH == 'x86_64' ]]; then
  source=(https://github.com/github/git-lfs/releases/download/v$pkgver/git-lfs-linux-amd64-$pkgver.tar.gz)
  md5sums=('a8e582dce960822f39922c2e15583d1d')
else
  source=(https://github.com/github/git-lfs/releases/download/v$pkgver/git-lfs-linux-386-$pkgver.tar.gz)
  md5sums=('06b178796a79227c73b01e58113ca643')
fi

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 git-lfs "$pkgdir"/usr/bin/git-lfs
}
