# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=git-lfs-test-server
pkgver=0.3.0
pkgrel=1
pkgdesc="An open source Git extension for versioning large files"
arch=('i686' 'x86_64')
url="https://git-lfs.github.com/"
license=('MIT')

if [[ $CARCH == 'x86_64' ]]; then
  _binname=Linux.AMD64
  _dirname=lfs-test-server-linux-amd64
  md5sums=('f6819014718743a1a53dc44db957575c')
else
  _binname=Linux.386
  _dirname=lfs-test-server-linux-386
  md5sums=('202fdfa0c4b90b87865b8e3a75c7c1b9')
fi

source=(https://github.com/github/lfs-test-server/releases/download/v$pkgver/$_binname.gz)

package() {
  cd "$srcdir"/$_dirname
  install -Dm755 lfs-test-server "$pkgdir"/usr/bin/lfs-test-server
}
