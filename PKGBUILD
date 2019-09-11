# Maintainer: Dudemanguy <random342@airmail.cc>
pkgname=dbus-s6
pkgver=20190802
pkgrel=1
pkgdesc="s6 service scripts for dbus"
arch=('any')
url="https://github.com/artix-linux"
depends=('dbus' 's6-rc')
install=dbus.install
source=("dbus.run" "dbus.type")
sha256sums=('68b377243a3fcf3639ad7f2df1d97f1ef6f21bdf99567c6d34254f5e90428675'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006')

_inst_sv(){
    for file in run type; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/s6/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'dbus'
}
