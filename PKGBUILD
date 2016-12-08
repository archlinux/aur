# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=gti
pkgver=1.3.0
_commit="530a7ff"
pkgrel=1
pkgdesc="A silly git launcher"
arch=('i686' 'x86_64')
url="http://r-wos.org/hacks/gti"
license=('custom')
source=("https://github.com/rwos/gti/tarball/v$pkgver"
        'LICENSE')
md5sums=('0d8e4206fda5a343af7a1c530e7bfc73'
         '28c2baebd9f1dbe5498bae7ca90c005f')

build() {
  cd "$srcdir/rwos-gti-${_commit}"
  make
}

package() {
  cd "$srcdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "rwos-gti-${_commit}"
  install -Dm755 gti "$pkgdir/usr/bin/gti"
}

# vim:set ts=2 sw=2 et:
