# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=sponsorblockcast-git
_pkgname=sponsorblockcast
pkgver=r4.05b0dc1
pkgrel=1
pkgdesc='Skip Youtube sponsor segments on all LAN Chromecasts'
arch=('any')
url="https://github.com/nichobi/${_pkgname}"
license=('GPL3')
depends=('go-chromecast-git' 'jq' 'bc')
makedepends=('git')
provides=('sponsorblockcast')
source=(git+$url)
md5sums=(SKIP)

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -vDm 755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
    install -vDm 644 $_pkgname.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
}

