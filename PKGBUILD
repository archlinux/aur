# Maintainer: Dudemanguy <random342@airmail.cc>
pkgname=cups-s6
pkgver=20190802
pkgrel=1
pkgdesc="s6 service scripts for cups"
arch=('any')
url="https://github.com/artix-linux"
depends=('cups' 's6-rc')
install=cupsd.install
source=("cupsd.run" "cupsd.type")
sha256sums=('1db6a12394ff0555409207e282e496ab5a4e3b79567bdc66ee03aade75928375'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006')

_inst_sv(){
    for file in run type; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/s6/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'cupsd'
}
