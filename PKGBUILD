# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=git-lfs-bin
_pkgname=${pkgname%-bin}
pkgver=1.5.4
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
  md5sums=('7188ddcbd9829247130ede10f2e09771')
else
  source=(https://github.com/github/git-lfs/releases/download/v$pkgver/git-lfs-linux-386-$pkgver.tar.gz)
  md5sums=('bc08f37f50cc73a0f6ee49f7abb4096c')
fi

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 git-lfs "$pkgdir"/usr/bin/git-lfs
}
