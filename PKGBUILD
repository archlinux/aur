# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=xandikos
pkgver=0.0.4
pkgrel=4
pkgdesc='CardDAV/CalDAV server that backs onto a Git repository'
arch=('any')
url=https://jelmer.uk/code/xandikos/
license=('GPL3')
depends=('python-defusedxml' 'python-dulwich' 'python-icalendar' 'python-jinja')
makedepends=('python-setuptools')
source=("xandikos-$pkgver.tar.gz::${url}tarball/v$pkgver")
sha512sums=('eae4e408adb9ffd55671b6203b871faa670642310a05f3f54bd829c2ded62b6dcdfcf57d1a4611371aeb9dd34596168bd0d2fb8df9f945deaf83e9c94eb1e56d')

check() {
  make check
}

package() {
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 xandikos.1 "$pkgdir"/usr/share/man/man1/xandikos.1
}

# vim:set ts=2 sw=2 et:
