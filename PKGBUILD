    # Maintainer: shadichy <shadichy.dev@gmail.com>
    pkgname=("systemback-cli")
    pkgver=1.8.9
    pkgrel=2
    pkgdesc='Simple system backup and restore application with extra features'
    arch=('x86_64')
    url='https://github.com/shadichy/systemback-archlinux'
    license=('GPL')
    depends=('util-linux' 'util-linux-libs' 'parted' 'qt5-base>=5.5.0' 'gcc-libs' 'procps-ng' 'gnu-free-fonts' 'dosfstools' 'libisoburn' 'squashfs-tools' 'syslinux' 'xterm' 'xz' 'mkinitcpio-live-boot' 'ncurses' 'libsystemback' 'systemback-efiboot-amd64')
    optdepends=('grub' 'btrfs-progs' 'jfsutils' 'reiserfsprogs' 'xfsprogs' 'unionfs-fuse' 'kdialog')
    makedepends=('ncurses' 'qt5-tools' 'make' 'gcc11' 'dpkg' 'debhelper' 'util-linux' 'util-linux-libs' 'qt5-base>=5.5.0' 'gcc-libs' 'procps-ng')
    source=(systemback-archlinux::git+https://github.com/shadichy/systemback-archlinux.git)
    md5sums=('SKIP')

    build() {
        cd "${srcdir}/systemback-archlinux/systemback"
        dpkg-buildpackage -d -us -uc
    }

    package() {
        dpkg-deb -xv "${srcdir}/systemback-archlinux/systemback-cli_${pkgver}_amd64.deb" "${srcdir}/systemback-archlinux/systemback-cli"
        cp -dr --no-preserve=ownership "${srcdir}/systemback-archlinux/systemback-cli/usr" "${pkgdir}/usr"
        install -dm755 "${pkgdir}/usr"
    }
