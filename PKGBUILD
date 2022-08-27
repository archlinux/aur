pkgname=kernel-install-mkinitcpio
_gitname=eos-systemd-boot
pkgver=1.1
pkgrel=1
pkgdesc='A framework for enabling systemd-boot automation using kernel-install with mkinitcpio'
arch=(any)
url='https://gitlab.com/dalto.8/eos-systemd-boot'
license=(GPL2)
depends=(systemd)
source=("$_gitname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_gitname-$pkgver.tar.gz")
sha512sums=('21bcd5c9464de5e2c6c67d4b9bd21daf52014ff60e555fcf24af3e6c56b1027a3ec8858598f555961f131643a99e3a1229a2be25e4608c59265ad871f8f46276')

package()
{
    # install the package files
    cp -a "${srcdir}"/$_gitname-$pkgver/src/{usr,etc} "${pkgdir}"

    # mask the default loaderentry creator
    mkdir -p "${pkgdir}/etc/kernel/install.d"
    touch "${pkgdir}/etc/kernel/install.d/90-loaderentry.install"
}
