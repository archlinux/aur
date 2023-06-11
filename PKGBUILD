pkgname=kernel-install-mkinitcpio
_gitname=eos-systemd-boot
pkgver=1.4
pkgrel=1
pkgdesc='A framework for enabling systemd-boot automation using kernel-install with mkinitcpio'
arch=(any)
url='https://gitlab.com/dalto.8/eos-systemd-boot'
license=(GPL2)
depends=(systemd mkinitcpio)
conflicts=(dracut kernel-install-for-dracut)
source=("$_gitname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_gitname-$pkgver.tar.gz")
sha512sums=('4db028e62e42f54253665efbc0beae36865fd9b678ce26e1294454ab9bb664c9e96024c261475160c9c6b63073d9919a5c321f889ef872905f80bd45c99de9b7')

package()
{
    # install the package files
    cp -a "${srcdir}"/$_gitname-$pkgver/src/{usr,etc} "${pkgdir}"

    # mask the default loaderentry creator
    mkdir -p "${pkgdir}/etc/kernel/install.d"
    touch "${pkgdir}/etc/kernel/install.d/90-loaderentry.install"
}
