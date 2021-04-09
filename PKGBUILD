# Maintainer: TechieDamien <damien@techiedamien.xyz>
pkgname=i3-utils
pkgver=1.0.1
pkgrel=2
pkgdesc="A bunch of scripts to make using i3 easier."
arch=('any')
url="https://github.com/tasinet/i3-utils"
license=('unknown')
depends=('jq')
makedepends=('git')
source=("git+https://github.com/tasinet/i3-utils.git")
md5sums=(SKIP)

prepare() {
        cd "$pkgname"
        for i in *.sh; do
            sed "s/\.\///g" $i > $i.new
            mv $i.new $i
        done
}            

package() {
	cd "$pkgname"
        mkdir -p "$pkgdir/usr/bin/"
	install *.sh "$pkgdir/usr/bin/"
}
