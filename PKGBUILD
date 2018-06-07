# Maintainer: Mike Krüger <mikekrueger81[at]gmail.com>

pkgname=hblox-git
_gitname=hblox
pkgdesc='hblox is an command line ad blocker for Linux using the hosts file. (written in Python 3)'
pkgver=r13.ee462b9
pkgrel=1
arch=('any')
url="https://gitlab.com/memoryleakx/hblox"
license=('GPL3')
depends=('python-clint>=0.5'
         'python-urllib3>=1.22'
         'sqlite>=3.20')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd $_gitname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_gitname
    install -Dm755 "hblox" "$pkgdir/usr/bin/hblox"
}
