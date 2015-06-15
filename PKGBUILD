# Maintainer: Moritz Lipp <mail@mlq.me>
pkgname=pulse-bin
_pkgname=pulse
pkgver=0.1.3
pkgrel=1
pkgdesc="Synchronise your files without also sharing them with a stranger in the
cloud."
arch=('x86_64' 'i686')
url="https://ind.ie/pulse/"
license=('GPL')
makedepends=('sed' 'pacman-git')
source_x86_64=("http://s3-eu-west-1.amazonaws.com/download.ind.ie/$_pkgname/latest/$_pkgname-linux-amd64-$pkgver.tar.gz")
source_i686=("http://s3-eu-west-1.amazonaws.com/download.ind.ie/$_pkgname/latest/$_pkgname-linux-386-$pkgver.tar.gz")
md5sums_x86_64=('e1078c5e0dea7cc7ec41365cdb57cd99')
md5sums_i686=('f6c4baa9e6ba92a5539e93a7cbc1c05f')

package() {
  ARCH=`echo $arch | sed 's/x86_64/amd64/g;s/i686/386/g'`
  cd "$srcdir/$_pkgname-linux-$ARCH-$pkgver/"
  install -D -m777 pulse "$pkgdir/usr/bin/pulse"
  install -D -m664 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
