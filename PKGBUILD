# Maintainer: David Sutton <kantras - gmail.com>
# Contributor: Shanmu Thiagaraja <sthiagaraja+AUR@prshanmu.com>
# Contributor: Limao Luo
# Contributor: Luceo
# Contributor: Revellion

pkgname=xen-4.4
_pkgname=xen
pkgver=4.4.2
pkgrel=3
pkgdesc="Virtual Machine Hypervisor & Tools"
arch=(i686 x86_64)
url="http://www.xenproject.org/"
license=(GPL2)
depends=(bin86 bridge-utils curl gnutls iproute2 libaio libcap-ng libiscsi libjpeg-turbo libpng libseccomp lzo2 nss pixman pciutils python python2 sdl wget vde2 yajl)
[[ "$CARCH" == "x86_64" ]] && depends+=(lib32-glibc)
makedepends=(cmake dev86 git iasl markdown ocaml-findlib)
optdepends=('xen-docs: Official Xen Documentation' 'openvswitch: Optional Networking support')
conflicts=(xen xen-4.2{,-testing-hg} xen-{gdbsx,hg-unstable,rc,git} xen-4.3{,-testing-hg})
backup=(etc/modules-load.d/$_pkgname.conf etc/$_pkgname/xl.conf etc/conf.d/xen{stored,consoled,domains,commons} etc/$_pkgname/grub.conf)
options=(!buildflags !strip)
install=$_pkgname.install
changelog=ChangeLog
source=(http://bits.xensource.com/oss-xen/release/$pkgver/$_pkgname-$pkgver.tar.gz
    http://xenbits.xen.org/xen-extfiles/ipxe-git-9a93db3f0947484e30e753bbd61a10b17336e20e.tar.gz
    http://xenbits.xen.org/xen-extfiles/lwip-1.3.0.tar.gz
    http://xenbits.xen.org/xen-extfiles/zlib-1.2.3.tar.gz
    http://xenbits.xen.org/xen-extfiles/newlib-1.16.0.tar.gz
    http://xenbits.xen.org/xen-extfiles/pciutils-2.2.9.tar.bz2
    http://xenbits.xen.org/xen-extfiles/polarssl-1.1.4-gpl.tgz
    http://xenbits.xen.org/xen-extfiles/grub-0.97.tar.gz
    http://xenbits.xen.org/xen-extfiles/tpm_emulator-0.7.4.tar.gz
    http://xenbits.xen.org/xen-extfiles/gmp-4.3.2.tar.bz2
    xen.install
    09_xen
    ati-passthrough.patch
    disable-bluez.patch
    etherboot-gcc5.patch
    gcc5.patch
    gnutls-3.4.0.patch::http://git.alpinelinux.org/cgit/aports/plain/main/xen/gnutls-3.4.0.patch?id=628f27939412a7d6fb67734bd644119a1f49463a
    seabios-gcc5.patch
    xen-gcc5.patch
    xsa133-qemut.patch
    xsa133-qemuu.patch
    proc-xen.mount
    var-lib-xenstored.mount
    xenconsoled.service
    conf.d-xenconsoled
    xendomains.service
    xendomU@.service
    xenstored.service
    conf.d-xenstored
    tmpfiles.d-$_pkgname.conf
    grub.conf
    $_pkgname.conf)
noextract=(lwip-1.3.0.tar.gz
    zlib-1.2.3.tar.gz
    newlib-1.16.0.tar.gz
    pciutils-2.2.9.tar.bz2
    polarssl-1.1.4-gpl.tgz
    grub-0.97.tar.gz
    tpm_emulator-0.7.4.tar.gz
    gmp-4.3.2.tar.bz2
    ipxe-git-9a93db3f0947484e30e753bbd61a10b17336e20e.tar.gz)

sha256sums=('cd53592e86669e5e8c4d4a731b0199e8af17d8eadbb8f26dbb69f1b751259204'
            '632ce8c193ccacc3012bd354bdb733a4be126f7c098e111930aa41dad537405c'
            '772e4d550e07826665ed0528c071dd5404ef7dbe1825a38c8adbc2a00bca948f'
            '1795c7d067a43174113fdf03447532f373e1c6c57c08d61d9e4e9be5e244b05e'
            'db426394965c48c1d29023e1cc6d965ea6b9a9035d8a849be2750ca4659a3d07'
            'f60ae61cfbd5da1d849d0beaa21f593c38dac9359f0b3ddc612f447408265b24'
            '2d29fd04a0d0ba29dae6bd29fb418944c08d3916665dcca74afb297ef37584b6'
            '4e1d15d12dbd3e9208111d6b806ad5a9857ca8850c47877d36575b904559260b'
            '4e48ea0d83dd9441cc1af04ab18cd6c961b9fa54d5cbf2c2feee038988dea459'
            '936162c0312886c21581002b79932829aa048cfaf9937c6265aeaa14f1cd1775'
            'd80117b187f2c607f53fcfc012e871b2f1c15fbb44f38728b1a29fa9e3f0808b'
            '06c9f6140f7ef4ccfc4b1a7d9732a673313e269733180f53afcd9e43bf6c26bb'
            'd93c2d5bcdf0c3e4c6e8efb357cb4b9d618209025361f5ccd9d03651a8acd7a3'
            '0ba03980b4d300fea3f8bbe47b188a491ddf871246e5bd214b1ed15e971324d2'
            'deeec880522c1374ad135dc8b4c14c7b301464a60fbac410efb3db70f670eed9'
            '01fda9bf39f044d6f01e17965f576935595e6453d9aac346cf0c608de541a2c2'
            'e25d38376e22f6f935d2c0ce1b9d6e6b47ff261b5e6056bc3b47168739d7a992'
            '756a7ce9b6e89a12968cbaf9d03cb84b7fed7ab8bf40fbc05b4b035e8e56d7f3'
            '9233e2fd2e401fabf910e8e267beceefdea3d64ba1e09a6c4fea400843d96e8b'
            'e7ca0106a9d4bfe472b3b52bbed8646b47305634ff16c3e17ed6185296a7e7ff'
            '0cbc0415ef63bc195a0338441f3770d9fe6741e894879e35d1a6609ad028e42f'
            '139eed988bfaf8edc8ccdfd0b668382bd63db48ce17be91776182a7e28e9d88c'
            'c19146931c6ab8e53092bd9b2ebbfda5c76fd22ad3b1d42dcda3dd1b61f123ff'
            'e4af7891e816b9549ebeff766a78036626c0e278734e5625b8e7d68729530ded'
            '48d76cc6f25caa79b3f527c96a0883b1decb9012f6616f61336c8d43791bf007'
            '0bd45d9de6456c4f9adf32e726f2db3a3cd0423c1d161b442e8a1666d2e68e3f'
            '012cc60ffdcb0e061d04d404eb9232734554aef4dc4b551f66adf82a655e6e41'
            '633d334c55395fac3f16dbe56dd7b7524d560b513d1895b53c89943033a45f39'
            '0e1ad0a6a72b0c22025a556c23235a8f663427f1e769c45fe39d1c525bf82eff'
            '40e0760810a49f925f2ae9f986940b40eba477dc6d3e83a78baaae096513b3cf'
            '3f0af16958c3e057b9baa5afc47050d9adf7dd553274dd97ae4f35938fefb568'
            '50a9b7fd19e8beb1dea09755f07318f36be0b7ec53d3c9e74f3266a63e682c0c')

prepare() {
    cd "$_pkgname-$pkgver/"

    ### Patching 

    # Security Patches

    # Security Patches - qemu-xen
    cd tools/qemu-xen-traditional
    patch -p1 -i "$srcdir/xsa133-qemut.patch"
    cd ../../

    # Security Patches - qemu-upstream
    cd tools/qemu-xen
    patch -p1 -i "$srcdir/xsa133-qemuu.patch"
    cd ../../

    # Compile Patches
    patch -Np1 -i "$srcdir/disable-bluez.patch"
    patch -Np1 -i "$srcdir/gnutls-3.4.0.patch"
    patch -p1 -i "$srcdir/xen-gcc5.patch"
    patch -p1 -i "$srcdir/gcc5.patch"
    echo "etherboot-gcc5.patch" >> tools/firmware/etherboot/patches/series
    cp "$srcdir/seabios-gcc5.patch" tools/firmware/
    cp "$srcdir/etherboot-gcc5.patch" tools/firmware/etherboot/patches/

    # Uncomment line below if you want to enable ATI Passthrough support (some reported successes, untested with 4.4)
    #patch -Np1 -i "$srcdir/ati-passthrough.patch"

    # Fix Install Paths
    sed -i 's:/sbin:/bin:' config/StdGNU.mk
    sed -i 's:/var/lock:/run/lock:' config/StdGNU.mk
    sed -i 's:/var/run:/run:' config/StdGNU.mk

    # Bypass distribution auto-discovery
    echo "CONFIG_LEAF_DIR=default" >> .config
    echo "SUBSYS_DIR=/run" >> .config
    echo "INITD_DIR=/etc/init.d" >> .config

    # Copy supporting tarballs into place
    cp "$srcdir/lwip-1.3.0.tar.gz" stubdom/
    cp "$srcdir/zlib-1.2.3.tar.gz" stubdom/
    cp "$srcdir/newlib-1.16.0.tar.gz" stubdom/
    cp "$srcdir/pciutils-2.2.9.tar.bz2" stubdom/
    cp "$srcdir/polarssl-1.1.4-gpl.tgz" stubdom/
    cp "$srcdir/grub-0.97.tar.gz" stubdom/
    cp "$srcdir/tpm_emulator-0.7.4.tar.gz" stubdom/
    cp "$srcdir/gmp-4.3.2.tar.bz2" stubdom/
    cp "$srcdir/ipxe-git-9a93db3f0947484e30e753bbd61a10b17336e20e.tar.gz" tools/firmware/etherboot/ipxe.tar.gz

}

build() {
    export CFLAGS+='-Wall -Wstrict-prototypes -Wno-unused-local-typedefs -Wno-sizeof-pointer-memaccess -fno-caller-saves'
    cd "$_pkgname-$pkgver/"
    ./autogen.sh
    ./configure PYTHON=/usr/bin/python2 --prefix=/usr --localstatedir=/run --enable-xend
    make LANG=C PYTHON=python2 dist-{xen,tools,kernels}
    export CFLAGS=-fno-caller-saves
    make LANG=C PYTHON=python2 dist-stubdom
}

package() {
    cd "$_pkgname-$pkgver/"

    make DESTDIR="$pkgdir" LANG=C PYTHON=python2 install-{xen,tools,kernels,stubdom}

    # Install files from AUR package
    cd ../
    for f in ${source[@]}; do
        [[ $f =~ .mount || $f =~ .service ]] && install -Dm644 $f "$pkgdir"/usr/lib/systemd/system/$f
    done
    install -Dm644 tmpfiles.d-$_pkgname.conf "$pkgdir"/usr/lib/tmpfiles.d/$_pkgname.conf
    install -Dm644 $_pkgname.conf "$pkgdir"/etc/modules-load.d/$_pkgname.conf
    install -Dm644 conf.d-xenstored "$pkgdir"/etc/conf.d/xenstored
    install -Dm644 conf.d-xenconsoled "$pkgdir"/etc/conf.d/xenconsoled
    install -Dm644 grub.conf "$pkgdir"/etc/xen/grub.conf
    install -Dm755 09_xen "$pkgdir"/etc/grub.d/09_xen

    cd "$pkgdir"

    # Fix paths in scripts, move to right locations and create missing directories
    sed -i 's:/etc/sysconfig:/etc/conf.d:' etc/init.d/xendomains
    sed -i 's:/var/lock:/run/lock:' etc/init.d/xendomains
    sed -i 's:/var/lock:/run/lock:' etc/xen/scripts/hotplugpath.sh
    sed -i 's:/var/run:/run:' etc/init.d/xencommons
    sed -i 's:/var/run:/run:' etc/xen/scripts/hotplugpath.sh
    sed -i 's:/var/run:/run:' etc/xen/scripts/locking.sh

    mv etc/init.d/xencommons etc/xen/scripts/xencommons
    mv etc/init.d/xendomains etc/xen/scripts/xendomains
    mv etc/init.d/xen-watchdog etc/xen/scripts/xen-watchdog
    mv etc/default/xencommons etc/conf.d/xencommons
    mv etc/default/xendomains etc/conf.d/xendomains
    mv var/xen/dump var/lib/xen/
    mkdir var/log/xen/console

    # Sanitize library path (if lib64 exists)
    if [[ -d usr/lib64 ]]; then
        cd usr/
        cp -r lib64/* lib/
        rm -rf lib64
	cd ../
    fi

    # Compress syms file and move to a share location
    gzip boot/$_pkgname-syms-*
    mv boot/$_pkgname-syms-*.gz usr/share/xen

    ##### Kill unwanted stuff #####
    # hypervisor symlinks
    rm -f boot/xen{,-4,-4.4}.gz

    # Documentation cleanup ( see xen-docs package )
    rm -rf usr/share/doc
    rm -rf usr/share/man

    # Pointless helper cleanup
    rm -f usr/bin/xen-python-path

    # Unnecessary qemu support files
    rm -rf usr/bin/qemu-*-xen
    rm -rf usr/etc
    rm -rf usr/libexec
    rm usr/share/qemu-xen/qemu/{palcode,openbios}-*
    rm usr/share/xen/qemu/openbios-*

    # Clean up udev rules naming
    mv etc/udev/rules.d/xen-backend.rules etc/udev/rules.d/40-xen-backend.rules

    # Cleanup additional leftover files
    rm -rf usr/include/cacard 
    rm -f usr/lib/libcacard*
    rm -f usr/lib/pkgconfig/libcacard.pc

    # Clean up left over empty directories
    rm -rf var/run var/lock var/xen etc/default etc/init.d

    # adhere to Static Library Packaging Guidelines
    rm -rf usr/lib/*.a
}
