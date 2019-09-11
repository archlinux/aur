# Maintainer: Dudemanguy <random342@airmail.cc>
pkgname=eudev-s6
pkgver=20190802
pkgrel=1
pkgdesc="s6 service scripts for eudev"
arch=('any')
url="https://github.com/artix-linux"
depends=('elogind' 's6-rc')
install=udevd.install
source=("udevd.run" "udevd.type")
sha256sums=('78bca25f04b157d6997c6480de9a23d2a65284b3362f20338b23455b9ec1214f'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006')

_inst_sv(){
    for file in type run; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/s6/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'udevd'
}
