# Maintainer: Richard Neumann <mail at richard dash neumann period de>
# Credits: Special thanks to reddit user @pahakala who inspired me to create this package.

pkgname='mkinitcpio-fbsplash'
pkgver='1.0.3'
pkgrel=1
url="https://aur.archlinux.org/packages/${pkgname}/"
pkgdesc='Tools to include a framebuffer based boot splash within the initcpio'
arch=('any')
license=('GPL3')
depends=('bash')
optdepends=('fbv: for image generation script.')
source=('fbsplash.hook' 'fbsplash.install' 'mkfbsplash')
sha256sums=('114d69bf95aa6cccb3dc131e13a49662389e75013d858267843b1c1a77dc2b0f'
            '2b16aa38772542d19be1c5aa652641b2acc189c2428a35681b8e55d7486e1668'
            'e385cd23b89de7ce859265fc5d60a8437779c4fb3ce17e09a832075ba3ee0654')
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

