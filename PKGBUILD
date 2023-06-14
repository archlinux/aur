# Author: zwei <zweidev+aur@zweihander.me>

pkgname=eldev-git
_pkgname=eldev
pkgver=1.4.1.r6.g586cf08
pkgrel=1
pkgdesc="Emacs-based build tool, targeted solely at Elisp projects"
arch=('any')
url='https://github.com/doublep/eldev'
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('eldev')
conflicts=('eldev')
source=("git+https://github.com/doublep/eldev.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "./bin/eldev" "$pkgdir/usr/bin/eldev"
}

