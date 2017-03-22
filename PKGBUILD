# Maintainer: Richard Neumann <mail at richard dash neumann period de>
# Credits: Special thanks to reddit user @pahakala who inspired me to create this package.

pkgname='mkinitcpio-fbsplash'
pkgver='1.0.1'
pkgrel=3
url="https://aur.archlinux.org/packages/${pkgname}/"
pkgdesc='Tools to include a framebuffer based boot splash within the initcpio'
arch=('any')
license=('GPL3')
depends=('bash')
optdepends=('fbv: for image generation script.')
source=('fbsplash.hook' 'fbsplash.install' 'mkfbsplash')
sha256sums=('a9a490071b8ec3232c1e012cbbde5a871d55c29726b84ad099e1a0f0ba0ddf71'
            '2b16aa38772542d19be1c5aa652641b2acc189c2428a35681b8e55d7486e1668'
            'a2dec17047857a6af0308c383a8ba9127ebbd25aa2ebef69b96a66152c3925ec')
conflicts=('fbsplash')


package() {
    # Install initcpio hook and install script
    install -d -m 755 ${pkgdir}/usr/lib/initcpio/{hooks,install}
    install -m 644 ${srcdir}/fbsplash.hook ${pkgdir}/usr/lib/initcpio/hooks/fbsplash
    install -m 644 ${srcdir}/fbsplash.install ${pkgdir}/usr/lib/initcpio/install/fbsplash

    # Install image generation script
    install -d -m 755 ${pkgdir}/usr/bin
    install -m 755 ${srcdir}/mkfbsplash ${pkgdir}/usr/bin/
}

