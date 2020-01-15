# Maintainer: Richard Neumann <mail at richard dash neumann period de>
# Credits: Special thanks to reddit user @pahakala who inspired me to create this package.

pkgname='mkinitcpio-fbsplash'
pkgver='1.0.4'
pkgrel=2
url="https://github.com/coNQP/${pkgname}"
pkgdesc='Tools to include a framebuffer based boot splash within the initcpio'
arch=('any')
license=('GPL3')
depends=('bash')
optdepends=('fbv: for image generation script.')
makedepends=('git')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')


package() {
    # Install initcpio hook and install script
    install -d -m 755 ${pkgdir}/usr/lib/initcpio/{hooks,install}
    install -m 644 ${srcdir}/${pkgname}/fbsplash.hook ${pkgdir}/usr/lib/initcpio/hooks/fbsplash
    install -m 644 ${srcdir}/${pkgname}/fbsplash.install ${pkgdir}/usr/lib/initcpio/install/fbsplash

    # Install image generation script
    install -d -m 755 ${pkgdir}/usr/bin
    install -m 755 ${srcdir}/${pkgname}/mkfbsplash ${pkgdir}/usr/bin/
}

