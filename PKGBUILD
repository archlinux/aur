# Maintainer: James Thomas <jgtcode@protonmail.com>

pkgname=borg-import-git
_pkgname=borg-import
pkgver=1
pkgrel=1
pkgdesc='Import backups from some other backup software into Borg'
url='https://borgbackup.github.io/'
license=('BSD')
arch=('x86_64')
depends=('borg' 'fakeroot')
source=(""${_pkgname}::git+https://github.com/borgbackup/${_pkgname}.git"")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
