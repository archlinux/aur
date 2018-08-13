# Maintainer: Genki Sky <sky at genki dot is>

pkgname=notmuch-extract-patch-git
pkgver=1
pkgrel=3
pkgdesc='Extract git patchset from notmuch emails'
arch=('i686' 'x86_64')
url='https://github.com/aaptel/notmuch-extract-patch'
license=('GPLv3')
depends=('notmuch' 'python')
makedepends=('git')
provides=('notmuch-extract-patch')
conflicts=('notmuch-extract-patch')
source=('git+https://github.com/aaptel/notmuch-extract-patch')
md5sums=('SKIP')

pkgver() {
    cd notmuch-extract-patch
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
    cd notmuch-extract-patch
    install -D -m 0755 notmuch-extract-patch "$pkgdir"/usr/bin/notmuch-extract-patch
}
