# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=git-lfs-test-server
pkgver=0.1.2
pkgrel=1
pkgdesc="An open source Git extension for versioning large files"
arch=('i686' 'x86_64')
url="https://git-lfs.github.com/"
license=('MIT')

if [[ $CARCH == 'x86_64' ]]; then
  _binname=lfs-test-server-linux-amd64
  md5sums=('72a5810200759a5869e926df965cee0b')
else
  _binname=lfs-test-server-linux-386
  md5sums=('3db223416b67aca24dff93cfd8eb60ba')
fi

source=(https://github.com/github/lfs-test-server/releases/download/v$pkgver/$_binname-$pkgver.tar.gz)

package() {
  cd "$srcdir"/$_binname
  install -Dm755 lfs-test-server "$pkgdir"/usr/bin/lfs-test-server
}
