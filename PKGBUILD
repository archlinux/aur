# Maintainer: Daniel Kirchner <daniel@ekpyron.org>

pkgname=patch-kernel-pacman-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to automatically build the linux package from ABS with additional patches upon updates."
arch=("any")
depends=('asp')
license=('MIT')
backup=('etc/pacman.d/patch-kernel.conf')
install="patch-kernel-pacman-hook.install"
source=('build-patched-kernel'
        'build-patched-kernel.hook'
        'patch-kernel.conf')
sha512sums=('e2164f6511c179847aa9fda2372f38c59035ed333c5f0b589bb353756a6dd4abbf951e4b96e0d7d43948c0d323ca2daea968de8f2574a127d29ff6d84a0939a1'
            '134eb0cfdaedb4d677a3cc92e5d9fd2f5a63a657ffefd5c217fa662d06b1ba6cb47e29915c2763e34afcefbfeba7e61aa932b7f6258c639ac1ff4b9fd9b17df5'
            'a8debf2dfac793689eb411cf31833eea9d8f20bd5af493f312f15d02082d77a2f025fa1cef047091cb95aae00f09a999ce4524c8696de10fcdb73678a8379025')

package() {
	install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
	install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
	install -m755 -d "${pkgdir}/etc/pacman.d"
	install -m755 "${srcdir}/build-patched-kernel" "${pkgdir}/usr/share/libalpm/scripts/build-patched-kernel"
	install -m644 "${srcdir}/build-patched-kernel.hook" "${pkgdir}/usr/share/libalpm/hooks/build-patched-kernel.hook"
	install -m644 "${srcdir}/patch-kernel.conf" "${pkgdir}/etc/pacman.d/patch-kernel.conf"
}
