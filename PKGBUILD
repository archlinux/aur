# $Id: PKGBUILD 142375 2011-11-08 22:04:23Z ronald $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Maintainer: ava1ar <mail(dot)avatar(at)gmail(dot)com>

pkgname=grub-legacy
_srcname=grub
pkgver=0.97
pkgrel=27
pkgdesc="A GNU multiboot boot loader"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/grub/"
depends=('ncurses' 'diffutils' 'sed' 'lib32-glibc')
conflicts=('grub')
makedepends=('autoconf')
makedepends_x86_64=('gcc-multilib')
optdepends=('xfsprogs: freezing of xfs /boot in install-grub script')
source=(ftp://alpha.gnu.org/gnu/grub/${_srcname}-${pkgver}.tar.gz{,.sig}
        menu.lst
        install-grub
        snapshot.patch
        menu.lst_gnu-hurd.patch
        graphics.patch
        raid.patch
        raid_cciss.patch
        xfs_freeze.patch
        2gb_limit.patch
        grub-special_device_names.patch
        grub-xvd_drives.patch
        initrd_max_address.patch
        splashimage_help.patch
        grub-install_addsyncs.patch
        grub-install_regexp.patch
        grub-install_aoe_support.patch
        grub-install_xvd.patch
        geometry-26kernel.patch
        print_func.patch
        mprotect.patch
        savedefault.patch
        find-grub-dir.patch
        intelmac.patch
        crossreference_manpages.patch
        ext3_256byte_inode.patch
        use_grub-probe_in_grub-install.patch
        objcopy-absolute.patch
        no-reorder-functions.patch
        modern-automake.patch
        no-combine-stack-adjustments.patch
        no-pie.patch
        static-vars-on-stack.patch
        ext4_support.patch
        ext4_fix_variable_sized_inodes.patch
        ext4_block_group.patch)
backup=('boot/grub/menu.lst')
sha1sums=('2580626c4579bd99336d3af4482c346c95dac4fb'
          'SKIP'
          '33d43d48000b2027f9baec8fc99d33e0c4500c96'
          '60e8f7e4c113b85165fd5d9cd724e8413a337a12'
          '395c1a4243d393059bc77a458158347dfd685484'
          '9001de20e5b6eb32c9747cb6e71aae88f918b9fe'
          '3d3281b2bf2b353db125297d058049209b4536fc'
          '207a0a258cff448de804a26ec212c104b0c67dd4'
          'eb832d9ee7ab588cad67b1f613d60519d3ede547'
          '9a938adbccbd42f47a3c4380d19bc0b67e9f4425'
          'e7e1f954a4b528bd1f987a1c8259da870c5c12ad'
          '61c4b5ad2253ab856943c2c57c8505c880bd30d1'
          '74e90f10baa2eafaf5e4cdb7c618c5d7fd83152f'
          'de68226dc1dbacf5315c4367a77e798d67bbbd97'
          '4816712bcb6541ca85583a479b46ba578665ab3f'
          '711fbc4099e41f3d44c8442cd674b46234560b9a'
          '0dd7ab0c782530b6b4d62156cec96ce74074346a'
          '7db04fe9c755f5e93aade57ed4d4ed62ee5de4be'
          '127e098a0f301ef835fb7b341dc19a126974dff3'
          '42fb758e3226869d05d2295d424f03eaa7704b1c'
          'caec864afccf8ae01c92b25d14d0e0daea4e51b1'
          '0c0c8c1beed6684cd9cb54c40f5e785ea33b8692'
          '92e5baef9bfae6c0d3122bf05138ad022f0bc04d'
          '81ff955f91b25423ffed0cdf4ba31953fb2784c4'
          'a07861fbbb116b8052649d54abffe610a968c293'
          '6a880733ad84ffebeef05515ebdf1ea451a4d054'
          '02f13de04b932093d07f9a52adf20df7f0468654'
          '8f6f13c0f752e20e690337488a178286ef1c381d'
          '07558de2935f4eefec243a6966095b68aa3b6e70'
          '610243204b776901a9696ab65c0729ec8fdb84d1'
          'c5aab6d3a5269054fc2e7f110ddc180d5595604d'
          '721bb91d381ee3e51c2e2af0b4cfa004032e15b1'
          '63a0eac56b9f3436a0baa522a3642d209956b54c'
          '51b4dfd479491a3decc25d7ef66d434a7cbe12a2'
          '028bcd02efa5cf6b1dab5e6cbc8690b50ea7425f'
          '421ed77f2bb7aacce7ae558c2d97a4b209a07ca0'
          '02a24bc24ab672d7d5e2b6ec2af6e8240b29fba9')
validpgpkeys=('1C2F76A695C9C8DCA55E4A431DDAE7A2FE06BDEF') # Yoshinori K. Okuji <SURNAME at gnu org>

prepare() {
    cd ${srcdir}/${_srcname}-${pkgver}

    patch -Np1 -i ../snapshot.patch
    patch -Np1 -i ../menu.lst_gnu-hurd.patch
    patch -Np1 -i ../graphics.patch
    patch -Np1 -i ../raid.patch
    patch -Np1 -i ../raid_cciss.patch
    patch -Np1 -i ../xfs_freeze.patch
    patch -Np1 -i ../2gb_limit.patch
    patch -Np1 -i ../grub-special_device_names.patch
    patch -Np1 -i ../grub-xvd_drives.patch
    patch -Np1 -i ../initrd_max_address.patch
    patch -Np1 -i ../splashimage_help.patch
    patch -Np1 -i ../grub-install_addsyncs.patch
    patch -Np1 -i ../grub-install_regexp.patch
    patch -Np1 -i ../grub-install_aoe_support.patch
    patch -Np1 -i ../grub-install_xvd.patch
    patch -Np1 -i ../geometry-26kernel.patch
    patch -Np1 -i ../print_func.patch
    patch -Np1 -i ../mprotect.patch
    patch -Np1 -i ../savedefault.patch
    patch -Np1 -i ../find-grub-dir.patch
    patch -Np1 -i ../intelmac.patch
    patch -Np1 -i ../crossreference_manpages.patch
    patch -Np1 -i ../ext3_256byte_inode.patch
    patch -Np1 -i ../use_grub-probe_in_grub-install.patch
    patch -Np1 -i ../objcopy-absolute.patch
    patch -Np1 -i ../no-reorder-functions.patch
    patch -Np1 -i ../modern-automake.patch
    patch -Np1 -i ../no-combine-stack-adjustments.patch
    patch -Np1 -i ../no-pie.patch
    patch -Np1 -i ../static-vars-on-stack.patch
    patch -Np1 -i ../ext4_support.patch
    patch -Np1 -i ../ext4_fix_variable_sized_inodes.patch
    patch -Np1 -i ../ext4_block_group.patch
}

build() {
    cd ${srcdir}/${_srcname}-${pkgver}

    autoreconf -fiv
    CFLAGS= LDFLAGS= ./configure --prefix=/usr --libdir=/usr/lib --bindir=/usr/bin \
        --sbindir=/usr/bin --mandir=/usr/share/man --infodir=/usr/share/info --disable-auto-linux-mem-opt
    make -j1
}

package() {
    cd ${srcdir}/${_srcname}-${pkgver}

    make DESTDIR=${pkgdir} install
    install -D -m644 ../menu.lst ${pkgdir}/boot/grub/menu.lst
    install -D -m755 ../install-grub ${pkgdir}/usr/bin/install-grub
}
