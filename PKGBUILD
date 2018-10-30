# Maintainer: dindy <lewdavatar at gmail dot com>

pkgname=vaclist
pkgver=r25.b45f2ce
pkgrel=1
pkgdesc='Add and check steam profiles to monitor profiles for bans'
url='https://github.com/DNDEBUG/vaCLIst'
license=('GPL3')
arch=('any')
depends=('bash' 'git' 'curl' 'jq')
makedepends=('git')
install="vaCLIst.install"
optdepends=('xclip: clipboard support')
provides=('vaCLIst.sh')
source=("$pkgname::git://github.com/DNDEBUG/vaCLIst")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm0755 vaCLIst.sh "$pkgdir/usr/bin/vaCLIst.sh"
}
