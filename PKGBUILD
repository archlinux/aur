# Maintainer: Dudemanguy <random342@airmail.cc>
pkgname=agetty-s6
pkgver=20190802
pkgrel=1
pkgdesc="s6 service scripts for agetty"
arch=('any')
url="https://github.com/artix-linux"
depends=('s6-rc')
install=agetty.install
source=("agetty.conf" "agetty.finish" "agetty.run" "agetty.type")
sha256sums=('4260c574b5b94d1b6e68c2aeaf188f80fa64027b35fc2eddd634501f13e372e1'
            'd3f8534ffd8c01e27e5d91a807c3017e3d94ae0b05d56a53b0741739943e7983'
            '00db8e4814177b6d83b91d9d370cfc9ec9ddfbfc472c2801d598f0e963160c1b'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006')

_inst_sv(){
    for file in conf finish run type; do
        if test -f "$srcdir/"agetty".$file"; then
            install -Dm755 "$srcdir/"agetty".$file" "$pkgdir/etc/s6/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'agetty-console'
    _inst_sv 'agetty-generic'
    _inst_sv 'agetty-serial'
    _inst_sv 'agetty-tty2'
    _inst_sv 'agetty-tty3'
    _inst_sv 'agetty-tty4'
    _inst_sv 'agetty-tty5'
	_inst_sv 'agetty-tty6'
    _inst_sv 'agetty-ttyAMAO'
    _inst_sv 'agetty-ttyS0'
    _inst_sv 'agetty-ttyUSB0'
}
