# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=git-lfs-bin
_pkgname=${pkgname%-bin}
pkgver=1.1.2
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
  md5sums=('8ae06f58d9133110e1ba7e5eddbe7058')
else
  source=(https://github.com/github/git-lfs/releases/download/v$pkgver/git-lfs-linux-386-$pkgver.tar.gz)
  md5sums=('376951ba496b97909a479ea45f896d6e')
fi

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 git-lfs "$pkgdir"/usr/bin/git-lfs
}
