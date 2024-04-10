# Maintainer: ghostbuster <ghost_buster+aur@posteo.de>
pkgname="manage-kernel-backups"
pkgver="1.1"
pkgrel=2
pkgdesc="Script collection to create and manage backups of updated kernels and their modules"
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')

depends=('bash')
optdepends=('dkms')
conflicts=(
  'kernel-modules-hook'
  'linux-rt'
  'linux-rt-lts'
  'linux-hardened'
  'linux-rt'
)
source=(
  '10-linux-kernel-pre-install.hook'
  '10-linux-modules-post-install.hook'
  '10-linux-modules-pre-install.hook'
  '91-linux-kernel-post-install.hook'
  '91-mkinitcpio-post-install.hook'
  '99-linux-kernel-post-install.hook'
  'manage_kernel_backup.sh'
)

sha512sums=(
  '5d9ff14a70cb1cddaa2810d2afe5ef3fb209eaadc35cc99b2c32f1dd38d46673d831410b75c0a0e7e391153313fe3d9bd04ccc75189f7541682878ed411b9bf5'
  'a46851cbaccc909b1e380db33c609a79de68a15dad33ba762c1e946c94d897aad9497200acbcb8371b8e69f0919e3aefa3f2887681b82e4fc888b340aa0ec09a'
  '2858db394a5fbfc2d44ed523bbfa9446bb6c1b0b433b005ccf06bea0e14ed9d6ec12a8bc44287e0490820bff27def8e218a9dcfb22e433454b9ca03754954a60'
  'b50c6e797f7ede53d9789d4f1ed67d50740ecce2fbce6b03c16fe1ca368bc2b433a7009f683486c05def22d2e5fe94ef006ce15b804ffad19f74d183ebed5ca9'
  'a9d2dfebf224669d91d8b66724d489292c26b00630b496905c5a78ea318a304bc725abff3831a01468f7115db2a612c3688d6c687cdf90851e95e303268b2293'
  'd838944672432bb01c1e5e8746fc016b8b13eab80a1fc266cc67afff19001a8e8fc0ee67b5ca990041ccca662223bcb7ee13f737bd8adcbeccdcb3cfa609c973'
  'fd7efe0cb4cd1a9ddceb60bb16070b7846bb280429855bc31e5645ca825d9ecff4b81381c66db5eaa174f9750810533b350a3624981935844680e35986449921'
)

package() {
  install -m 644 -D -t "$pkgdir/usr/share/libalpm/hooks/" "10-linux-kernel-pre-install.hook"
  install -m 644 -D -t "$pkgdir/usr/share/libalpm/hooks/" "10-linux-modules-post-install.hook"
  install -m 644 -D -t "$pkgdir/usr/share/libalpm/hooks/" "10-linux-modules-pre-install.hook"
  install -m 644 -D -t "$pkgdir/usr/share/libalpm/hooks/" "91-linux-kernel-post-install.hook"
  install -m 644 -D -t "$pkgdir/usr/share/libalpm/hooks/" "91-mkinitcpio-post-install.hook"
  install -m 644 -D -t "$pkgdir/usr/share/libalpm/hooks/" "99-linux-kernel-post-install.hook"
  install -m 755 -D -t "$pkgdir/usr/share/libalpm/scripts/" "manage_kernel_backup.sh"
}

