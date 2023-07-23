pkgname=kernel-install-mkinitcpio
_gitname=eos-systemd-boot
pkgver=1.5
pkgrel=1
pkgdesc='A framework for enabling systemd-boot automation using kernel-install with mkinitcpio'
arch=(any)
url='https://gitlab.com/dalto.8/eos-systemd-boot'
license=(GPL2)
depends=(systemd mkinitcpio)
conflicts=(dracut kernel-install-for-dracut)
source=("$_gitname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_gitname-$pkgver.tar.gz")
sha512sums=('8f7074af4aa34cf3ffcdc7a5f75adbde27b4df7af293746e170f4be52aa4e05ed62f981994ac9bf7b702c3243e9b061d40efed2e89251f510a573f476748f0c4')

package()
{
    # install the package files
    cp -a "${srcdir}"/$_gitname-$pkgver/src/{usr,etc} "${pkgdir}"

    # mask the default loaderentry creator
    mkdir -p "${pkgdir}/etc/kernel/install.d"
    touch "${pkgdir}/etc/kernel/install.d/90-loaderentry.install"
}
