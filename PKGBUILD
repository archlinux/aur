# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=dnload
pkgver=r14
pkgrel=1
pkgdesc='Build small executables'
arch=('any')
url='https://github.com/faemiyah/dnload/'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'git')

# Using alternative repository that works for Arch Linux, while waiting for pull request
#source=("git+https://github.com/faemiyah/dnload#tag=v$pkgver")
source=("dnload::git+https://github.com/xyproto/shrinky#branch=arch")

md5sums=('SKIP')

package() {
  cd "$pkgname"
  python setup.py install --optimize=1 --root "$pkgdir"
  install -Dm755 dnload.sh "$pkgdir/usr/bin/$pkgname"

  #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LI*E "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
