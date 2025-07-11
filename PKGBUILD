# Maintainer: meow <sosdjolfkhgsldjkfh@gmail.com>
# based on this package: https://aur.archlinux.org/packages/debtap
pkgname=debtap-git
pkgver=3.5.1.r15.gbd6a0752
pkgrel=1
pkgdesc='A script to convert .deb packages to Arch Linux packages, focused on accuracy. git version. Do not use it to convert packages that already exist on official repositories or can be built from AUR!'
arch=('any')
license=('GPL2')
depends=('bash' 'binutils' 'pkgfile' 'fakeroot')
url="https://github.com/helixarch/debtap"
source=("git+https://github.com/helixarch/debtap.git"
        "debtap.install")
provides=('debtap')
conflicts=('debtap')

sha512sums=('SKIP'
            '5317cf5da1142ed83b1b11c60ee4a70ad74d21f6f98c59b0ec45ad4026d4db4952fe061fb493e3a92675e6bb558ea059677db2bcf42b620cb71d5b772b288008')

pkgver() {
    cd "${srcdir}/debtap"
    git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

install=debtap.install

package() {
  cd "$srcdir/debtap"
  install -Dm755 debtap "$pkgdir/usr/bin/debtap"
}
