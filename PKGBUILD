# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: 	Jeroen Bollen <jbinero at gmail dot comau>

pkgname=ckbcomp
pkgver=1.208
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
arch=(any)
url="http://anonscm.debian.org/cgit/d-i/console-setup.git/"
license=('GPL2')
depends=('perl')
source=("http://ftp.de.debian.org/debian/pool/main/c/console-setup/console-setup_${pkgver}.tar.xz")
sha512sums=('2fbc68bd6cf10e61eae50cef8fa8e26cc293f22d8303969032e2b693e9e4424cd87bcb7a411868694f7fac66365b3ac2f414dd281bc3dd3ad22d52a25e268313')

package() {
    if [[ -d "${srcdir}/console-setup" ]]
    then
        cd console-setup
    elif [[ -d "${srcdir}/console-setup-${pkgver}" ]]
    then 
        cd console-setup-${pkgver} 
    else
	echo "Source directory not found.".
	exit 1
    fi


    if [[ ${?} != 0 ]]
    then
        cd console-setup-${pkgver}
    fi

    install -d ${pkgdir}/usr/bin/
    install -m755 Keyboard/ckbcomp ${pkgdir}/usr/bin/
}
