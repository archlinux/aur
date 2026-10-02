# Maintainer: nycex <bernhard <at> ithnet.com>
pkgname=procsnoop
pkgver=1.0.0
pkgrel=1
pkgdesc='Trace process fork/exec/exit, filtered by process subtree (execsnoop alternative)'
arch=('any')
url='https://codeberg.org/nycex/procsnoop'
license=('GPL-3.0-only')
depends=('python' 'python-bcc' 'LINUX-HEADERS')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/nycex/procsnoop/archive/v$pkgver.tar.gz")
b2sums=('e8546d3af33744e78758b835f690085b1bb8e75c955f7a2a3d6fcbb39cf0710f7cf87c7991c06b8bdba19766796e5f05866ad7ae77509defe50fc004e330c999')

check() {
  cd "$srcdir/$pkgname"
  python procsnoop --help >/dev/null 2>&1
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 procsnoop   "$pkgdir/usr/bin/procsnoop"
  install -Dm644 procsnoop.8 "$pkgdir/usr/share/man/man8/procsnoop.8"
}

