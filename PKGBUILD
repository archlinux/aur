# Maintainer: Christopher Sculley <cs.sculley at gmail dot com>
pkgname=sleepplan-git
pkgver=r20.17f01c6
pkgrel=2
pkgdesc="Calculate times to wake up based on bedtimes, and vice versa."
arch=('any')
license=('GPL3')
url="https://gitlab.com/csculley/sleepplan"
depends=('python3')
makedepends=('git')
provides=('sleepplan')
conflicts=('sleepplan')
source=("sleepplan-git::git+https://gitlab.com/csculley/sleepplan.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir"/usr/bin
    mv sleepplan.py sleepplan
	chmod +x sleepplan
    mv sleepplan "$pkgdir"/usr/bin
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
