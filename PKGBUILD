pkgname=kernel-install-mkinitcpio
_gitname=eos-systemd-boot
pkgver=1.3
pkgrel=1
pkgdesc='A framework for enabling systemd-boot automation using kernel-install with mkinitcpio'
arch=(any)
url='https://gitlab.com/dalto.8/eos-systemd-boot'
license=(GPL2)
depends=(systemd mkinitcpio)
conflicts=(dracut kernel-install-mkinitcpio)
source=("$_gitname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_gitname-$pkgver.tar.gz")
sha512sums=('80d55d3f176f83e4a08b97106c4e3c7f98763bf16ef867142472cba165817c36322c82588ad288e4d47fa5729f48149e53640530481c170f13abf859d402dfce')

package()
{
    # install the package files
    cp -a "${srcdir}"/$_gitname-$pkgver/src/{usr,etc} "${pkgdir}"

    # mask the default loaderentry creator
    mkdir -p "${pkgdir}/etc/kernel/install.d"
    touch "${pkgdir}/etc/kernel/install.d/90-loaderentry.install"
}
