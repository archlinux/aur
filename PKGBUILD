# Maintainer: Aaron Ogle <aaron@geekgonecrazy.com>

pkgname=openwmail
pkgver=1.0.0
pkgverdash=1-0-0
pkgrel=4
pkgdesc="openwmail"
arch=('x86_64')
license=('MLP-2.0')
url="https://github.com/openwmail/openwmail"
options=()

source_x86_64=("https://github.com/openWMail/openWMail/releases/download/v${pkgver}/openWMail_${pkgverdash}_Linux_x86_64.deb")
md5sums_x86_64=('d84ceea682905b58531c43f5962317fb')

depends=('libnotify' 'gconf')
optdepends=()

package() {
	echo "package freaking base ${pkgbase}"
        cd "${srcdir}"

        tar xf data.tar.gz -C "${pkgdir}"

        chmod 755 $pkgdir/opt
        chmod 755 $pkgdir/usr
        chmod 755 $pkgdir/usr/share
        chmod 755 $pkgdir/usr/share/applications

        mkdir -p "$pkgdir/usr/bin"
	chmod +x $pkgdir/opt/openwmail/openWMail
        ln -s $pkgdir/opt/openwmail/openWMail ${pkgdir}/usr/bin
}

