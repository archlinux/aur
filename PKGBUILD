# Maintainer: termuellinator

pkgname=sc-updater-git
pkgver=r22.c02f5ef
pkgrel=3
pkgdesc="A script to make installing the latest wine runners from Snatella's Awesome Star Citizen Runners even easier."
arch=('any')
depends=('bash')
makedepends=('git')
provides=('sc-updater')
conflicts=('sc-updater')
url="https://github.com/richardtatum/sc-runner-updater"
license=('CC0 1.0 Universal')
source=("${pkgname}::git://github.com/richardtatum/sc-runner-updater")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    }

package() {
    cd "${pkgname}"
    install -Dm755 update.sh "$pkgdir/usr/local/bin/sc-updater"
}
 
