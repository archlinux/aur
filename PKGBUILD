# Maintainer: Dudemanguy <random342@airmail.cc>
pkgname=elogind-s6
pkgver=20190802
pkgrel=1
pkgdesc="s6 service scripts for elogind"
arch=('any')
url="https://github.com/artix-linux"
depends=('elogind' 's6-rc')
install=elogind.install
source=("elogind.dependencies" "elogind.run" "elogind.type")
sha256sums=('9291726828590f8d9d158572c381e2cefc24adf21055036cba07585acc1abb62'
            'c7f062f5f126ec5f9cc1b3117a2b981c8d0ea6f8f284690dc764f4749359ee28'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006')

_inst_sv(){
    for file in dependencies type run; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/s6/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'elogind'
}
