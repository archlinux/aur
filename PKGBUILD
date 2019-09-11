# Maintainer: Dudemanguy <random342@airmail.cc>
pkgname=syslog-ng-s6
pkgver=20190802
pkgrel=1
pkgdesc="s6 service scripts for syslog-ng"
arch=('any')
url="https://github.com/artix-linux"
depends=('syslog-ng' 's6-rc')
install=syslog-ng.install
source=("syslog-ng.run" "syslog-ng.type")
sha256sums=('d3d55881a0100acc5755d70e64dbe694f809eaba8b551be029cb0510b925e3a7'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006')

_inst_sv(){
    for file in run type; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/s6/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'syslog-ng'
}
