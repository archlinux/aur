# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=xandikos
pkgver=0.0.5
pkgrel=1
pkgdesc='CardDAV/CalDAV server that backs onto a Git repository'
arch=('any')
url=https://www.xandikos.org/
license=('GPL3')
depends=('python-defusedxml' 'python-dulwich' 'python-icalendar' 'python-jinja')
makedepends=('python-setuptools')
source=("xandikos-$pkgver.tar.gz::https://www.jelmer.uk/code/xandikos/tarball/v$pkgver")
sha512sums=('e898e805d0fc5c8a718e4d305fe25e81aecad157c06687176f4f9d9e3e47d01d5f4505b8bc560035d8790be8629c2a9fd75467dc136099c9341915908fd07fb5')

check() {
  python setup.py test
}

package() {
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 xandikos.1 "$pkgdir"/usr/share/man/man1/xandikos.1
}

# vim:set ts=2 sw=2 et:
