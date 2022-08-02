    # Maintainer: shadichy <shadichy.dev@gmail.com>
    pkgname=("systemback-locales")
    pkgver=1.8.9
    pkgrel=2
    pkgdesc='Systemback language support'
    arch=('x86_64')
    url='https://github.com/shadichy/systemback-archlinux'
    license=('GPL')
    depends=('libsystemback')
    makedepends=('ncurses' 'qt5-tools' 'make' 'gcc11' 'dpkg' 'debhelper' 'util-linux' 'util-linux-libs' 'qt5-base>=5.5.0' 'gcc-libs' 'procps-ng')
    source=(systemback-archlinux::git+https://github.com/shadichy/systemback-archlinux.git)
    md5sums=('SKIP')

    build() {
        cd "${srcdir}/systemback-archlinux/systemback"
        dpkg-buildpackage -d -us -uc
    }

    package() {
        dpkg-deb -xv "${srcdir}/systemback-archlinux/systemback-locales_${pkgver}_all.deb" "${srcdir}/systemback-archlinux/systemback-locales"
        cp -dr --no-preserve=ownership "${srcdir}/systemback-archlinux/systemback-locales/usr" "${pkgdir}/usr"
        install -dm755 "${pkgdir}/usr"
    }
