pkgname=kernel-install-mkinitcpio
_gitname=eos-systemd-boot
pkgver=1.0
pkgrel=1
pkgdesc='A framework for enabling systemd-boot automation using kernel-install with mkinitcpio'
arch=(any)
url='https://gitlab.com/dalto.8/eos-systemd-boot'
license=(GPL2)
depends=(systemd)
source=("$_gitname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_gitname-$pkgver.tar.gz")
sha512sums=('d7514a302c27f5f27aed6cf80f273c4c20d4d2956baea814b51d4b3ef63c467b64d2560dab3b127a01dd3e35e1a4a46ae79b5c3ed216f67a44b8603f893f49fb')

package()
{
    # install the package files
    cp -a "${srcdir}"/$_gitname-$pkgver/src/{usr,etc} "${pkgdir}"

    # mask the default loaderentry creator
    mkdir -p "${pkgdir}/etc/kernel/install.d"
    touch "${pkgdir}/etc/kernel/install.d/90-loaderentry.install"
}
