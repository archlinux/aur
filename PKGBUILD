# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=git-lfs
pkgver=1.0.2
pkgrel=2
pkgdesc="An open source Git extension for versioning large files"
arch=('i686' 'x86_64')
url="https://git-lfs.github.com/"
license=('MIT')
depends=('git')
install=git-lfs.install

if [[ $CARCH == 'x86_64' ]]; then
  source=(https://github.com/github/git-lfs/releases/download/v$pkgver/git-lfs-linux-amd64-$pkgver.tar.gz)
  md5sums=('259380d916fc6519c355432fbc7ae1f5')
else
  source=(https://github.com/github/git-lfs/releases/download/v$pkgver/git-lfs-linux-386-$pkgver.tar.gz)
  md5sums=('77370955ae6a62c8d5033a427014f9db')
fi

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 git-lfs "$pkgdir"/usr/bin/git-lfs
}
