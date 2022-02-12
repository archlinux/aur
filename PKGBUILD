# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='yubikey_switch'
pkgdesc='Helps use multiple yubikeys (as smartcards) with the same subkeys.'
pkgver=1.0
pkgrel=1
arch=('any') 
url="https://github.com/SP5D/${pkgname}"
license=('GPL3')
source=( "git+https://github.com/SP5D/${pkgname}.git" )
sha512sums=( 'SKIP' )

build()
{
    cd ${pkgname}
    make
}

package()
{
    install -D -m644 "${pkgname}/51.yubikey_switch.rules" "${pkgdir}/etc/udev/rules.d/51.yubikey_switch.rules"
    install -D -m744 "${pkgname}/yubikey_switch" "${pkgdir}/usr/bin/yubikey_switch"
}
