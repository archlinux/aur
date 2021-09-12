# Maintainer: Librewish <librewish@gail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: darkcoder <mario_vazq@hotmail.com>
pkgname=os-prober-btrfs
_pkgname=os-prober
pkgver=1.79
pkgrel=1
pkgdesc="Utility to detect other OSes on a set of drives (with additional patches to detect btrfs systems and other systems)"
url="http://joey.kitenet.net/code/os-prober/"
arch=('x86_64')
license=('GPL3')
depends=('sh')
provides=('os-prober' 'os-prober-garuda')
conflicts=('os-prober' 'os-prober-garuda')
replaces=('os-prober-garuda')
source=(http://http.debian.net/debian/pool/main/o/${_pkgname}/${_pkgname}_${pkgver}.tar.xz
  os-prober-newnsdirfix.patch
  os-prober-1.49-fix-grub2.cfg-parsing.patch
  os-prober-1.49-grub2-mount.patch
  os-prober-probe-MD-devices.patch
  os-prober-linux-secure-boot.patch
  os-prober-btrfsfix.patch
  os-prober-accept-ESP-on-IMSM.patch
  os-prober-dont-load-all-fs-module-and-dont-test-mount.patch
  os-prober-fix-btrfs-subvol-mounted-tests.patch
  os-prober-skip-part-on-multipath.patch
  Improve-btrfs-handling-on-os-probing-for-grub2.patch
  os-prober-btrfs-absolute-subvol.patch
  os-prober-40grub-check-grub2.patch
  os-prober-btrfs-snapshot-detection.patch
  os-prober-btrfs-always-detect-default.patch
  os-prober-05efi-blkid.patch
  os-prober-multiple-initrd.patch
  os-prober-make-btrfsprogs-optional.patch
  os-prober-disable-debug.patch)
md5sums=('08d3bfff00f1f7c068ce509656728eba'
         '25472f3c6f27681df6e01ff275a7b571'
         '282040a02e5150736234511d9986f4ac'
         '12cc212f04ac0768de9a1525df12e86e'
         '5532000280ed1ded65e417c90c552c1b'
         '7b396da508fd8c810b25680a0fd48f51'
         '4570445b02760c8f8580f935ee32d3ca'
         'd59438eb023d066b134b5c07cf45bf0f'
         '2c8ee5d22864a274f4f8f755108137bf'
         '014191f41eb52859160303e8ae439a6c'
         '675816cc8c78600be13e7d25d9077374'
         'ad9bc064acd5300e87c5420e2a431bee'
         'cd8fb7fb7e796a23224debad5a65245f'
         '56df8e39093ea36ec7cbed7d3cfe4ce5'
         '60d1b370c3910f01dc38f933069bc315'
         '79e62f50656ac80eaab99189e23d886b'
         'dc1f6d454794807b6a98f4146789c0aa'
         'e3c5edc2b078880ab0dfbf15731549f3'
         '03d733433697d5f0e4fddc506b89575e'
         'ab664f2e22a098f83b42c06babd9ab20')
sha256sums=('abe6317d078c4e51e322e62036b6df4a698bfe80c5be110a08894841179810ee'
            '9301e3bbb7964a962f43ebe54dea77f56c1dffb91d99e23f306faefd8667c30a'
            '71222cbe521abb676a0441a7e58cd58161b992d1e19e34eb0ee951c6b891e474'
            '754a8ac582dc0d8d882bb4c75d1216d2a2ec892848cd5cef353183d932d7026f'
            '7969ba7066cdd00ad21fdb9d84bf57955adcfc9b844b6955a0b5cb28eafe304a'
            'd66bbed46770f30198c181e6be3168ea288150800098e59874bba78dd0997ace'
            '66ed152fd58e6cfaf9a4b656140587f3344ade4d79a8979c9e45b10f435f41df'
            '595feaab34a49445030926d2adc6b472a513441bbb9c780c89425ae7ce97e97b'
            '4b1b27b466a206e44c3059e637026d4d0e1ce12a5bf30888f5896d29ceaa530a'
            'ded9ecced92c7c91a56598e3ac1ff197e79cc08395190e9a62725b9c45603734'
            '7cb99753a4c552f6d764591a8a372bf3ecfb25b2dc888316e8e7840ca208aa16'
            'fcd2764c95a5f919e9d50c018d090f7c5b7dce801f899083fca2bcd0dc20ee12'
            '015f9e7c5d38df39928164d6537c3699da7d815bc91a582832714bbbbe56d49f'
            'ed70c45f0170cbe674beba1f8b7f943a9304e5c6d1843d959ceed9239740a763'
            '987396baafea006467498cca8bc9d4926b8efe7b553462b9f14b1616992dd03d'
            '795b2fe197bd9a5df873eb794a42a3e42de487b758fe6076fb356d1779844334'
            '41cd45207f55f9b7871e05fb2068d9b3f38bd70abea9af5458a046b42dad621d'
            '509c4e97621f930e59e21ff63b462831df1f6da0750afed27693aa4be0f1abff'
            '23ddae7702ad49696a6a2b6c53a844f159d1972d9b420d9ea691fcf9c796de1d'
            'fa9394bdf5298847474e55c528fa5e4fe25611239c5ca9594d572b22baa4d28c')

prepare() {
  cd ${_pkgname}

  patch -p1 -i "$srcdir"/os-prober-newnsdirfix.patch
  patch -p1 -i "$srcdir"/os-prober-1.49-fix-grub2.cfg-parsing.patch
  patch -p1 -i "$srcdir"/os-prober-1.49-grub2-mount.patch
  patch -p1 -i "$srcdir"/os-prober-probe-MD-devices.patch
  patch -p1 -i "$srcdir"/os-prober-linux-secure-boot.patch
  patch -p1 -i "$srcdir"/os-prober-btrfsfix.patch
  patch -p1 -i "$srcdir"/os-prober-accept-ESP-on-IMSM.patch
  patch -p1 -i "$srcdir"/os-prober-dont-load-all-fs-module-and-dont-test-mount.patch
  patch -p1 -i "$srcdir"/os-prober-fix-btrfs-subvol-mounted-tests.patch
  patch -p1 -i "$srcdir"/os-prober-skip-part-on-multipath.patch
  patch -p1 -i "$srcdir"/Improve-btrfs-handling-on-os-probing-for-grub2.patch
  patch -p1 -i "$srcdir"/os-prober-btrfs-absolute-subvol.patch
  patch -p1 -i "$srcdir"/os-prober-40grub-check-grub2.patch
  patch -p1 -i "$srcdir"/os-prober-btrfs-snapshot-detection.patch
  patch -p1 -i "$srcdir"/os-prober-btrfs-always-detect-default.patch
  patch -p1 -i "$srcdir"/os-prober-05efi-blkid.patch
  patch -p1 -i "$srcdir"/os-prober-multiple-initrd.patch
  patch -p1 -i "$srcdir"/os-prober-make-btrfsprogs-optional.patch
  patch -p1 -i "$srcdir"/os-prober-disable-debug.patch

  # adjust lib dir to allow detection of 64-bit distros
  sed -i -e "s:/lib/ld\*\.so\*:/lib*/ld*.so*:g" os-probes/mounted/common/90linux-distro
  rm -f Makefile
}

build() {
  cd ${_pkgname}
  make newns
}

package() {
  cd ${_pkgname}

  install -Dm 755 os-prober linux-boot-prober -t "${pkgdir}/usr/bin"
  install -Dm 755 newns -t "${pkgdir}/usr/lib/os-prober"
  install -Dm 755 common.sh -t "${pkgdir}/usr/share/os-prober"

  for dir in os-probes os-probes/mounted os-probes/init linux-boot-probes linux-boot-probes/mounted; do
    install -dm 755 "${pkgdir}/usr/lib/${dir}"
    install -m 755 -t "${pkgdir}/usr/lib/${dir}" "${dir}"/common/*
    [[ -d "${dir}"/x86 ]] && cp -r "${dir}"/x86/* "${pkgdir}/usr/lib/${dir}"
  done

  install -Dm 755 os-probes/mounted/powerpc/20macosx "${pkgdir}"/usr/lib/os-probes/mounted/20macosx
  install -dm 755 "${pkgdir}"/var/lib/os-prober
}
