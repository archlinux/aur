pkgname="rganalysis-git"
pkgver=r50.6ed200f
pkgrel=1
pkgdesc='Add Replay Gain tags to your whole music library'
provides=('rganalysis')
arch=('any')
url='https://github.com/wummel/rganalysis'
license=('GPL2')
depends=('python2' 'quodlibet' 'gstreamer')
source=('git+https://github.com/wummel/rganalysis.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/rganalysis"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    sed -i -- 's/env python/env python2/g' "$srcdir/rganalysis/rganalysis.py"
}

package() {
    install -Dm 755 "$srcdir/rganalysis/rganalysis.py" "$pkgdir/usr/bin/rganalysis"
}
