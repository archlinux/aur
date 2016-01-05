# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Simon Peter Nicholls (simon <at> mintsource <dot> org)

pkgname=selinux-refpolicy-arch
_origname=refpolicy
_policyname=refpolicy-arch
_origver=20151208
_patchver=1
pkgver=${_origver}.${_patchver}
pkgrel=1
pkgdesc="Modular SELinux reference policy including headers and docs with Arch Linux patch"
arch=('any')
url="http://oss.tresys.com/projects/refpolicy"
license=('GPL')
groups=('selinux')
depends=('linux-selinux')
makedepends=('checkpolicy>=2.1.8' 'policycoreutils>=2.1.10'
             'libsepol>=2.1.4' 'libsemanage>=2.0.29')
backup=(etc/selinux/config)
install=${pkgname}.install
source=("https://raw.githubusercontent.com/wiki/TresysTechnology/${_origname}/files/${_origname}-2.${_origver}.tar.bz2"
        'config'
        '0001-Label-Xorg-server-binary-correctly-on-Arch-Linux.patch'
        '0002-Label-OpenSSH-files-correctly-on-Arch-Linux.patch'
        '0003-Label-OpenSSH-systemd-unit-files.patch'
        '0004-Label-some-user-session-DBus-services-as-bin_t.patch'
        '0005-Allow-umount-to-atomically-write-run-mount-utab.patch'
        '0006-Allow-the-kernel-to-unlink-block-devices.patch'
        '0007-Label-gedit-plugins-properly-on-Arch-Linux.patch'
        '0008-Add-file-contexts-for-usr-bin-lib-sbin-when-they-exi.patch'
        '0009-Add-file-context-substitutions-for-systemd.patch'
        '0010-Rename-sbin-and-usr-sbin-directories-usr-s-bin.patch'
        '0011-Rename-usr-sbin-to-usr-s-bin-in-contrib-modules.patch'
        '0012-Customize-build.conf-for-Arch-Linux.patch'
        '0013-Allow-using-sys-fs-cgroup-symlinks.patch'
        '0014-Label-some-unit-files-in-contrib-modules.patch'
        '0015-Add-an-interface-for-systemd-daemons-to-configure-lo.patch'
        '0016-Add-systemd-backlight-policy.patch'
        '0017-Add-systemd-binfmt-policy.patch'
        '0018-Make-fs_register_binary_executable_type-interface-al.patch'
        '0019-systemd-timedated-and-systemd-timesyncd-policies.patch'
        '0020-Add-systemd-modules-load-policy.patch'
        '0021-Add-systemd-rfkill-policy.patch')
sha256sums=('2dd2f45a7132137afe8302805c3b7839739759b9ab73dd1815c01afe34ac99de'
            'c9f7cce9a06fd0595b3dd47d4fdde9d9c7457120c42c5f08bfdc5e89eb9a61df'
            '42ac70848ec45b62b77d30e5e8fc2ecda0fd66eda6adc96fccac1811440313a0'
            '50774986baaf6d72587493039dc0be1e1a6ec755eec898a2839efc9a26eef56d'
            '25cd3fa8d5a587d9fecb68d4a0a7c57f8739cfffab164742f6568aca61b0f18b'
            'cfd1ea48eb4a5502f3fda4b9c2603d579c35861798f5ec4c7582ff99a183ee0a'
            '2dad570f1865cc6e398b3319f0aa8e1765b93aad7d1a72a68c81a9a7b5a27c36'
            '86827b6c9916a790adbb4f0e282fb823290383ee574b51c829ee939d7c522b4c'
            'f6604f6b279696b1b2b30a7c88c64e4157d1edbfba8080e9e05a3a8347d6e39e'
            '5a46e3630682103732ca80e209d17ff0478a5efac81a8810d613b3f776b26352'
            'a840b268fd553f85d41298533baf172eec5f02b9f8982cd93193254f02c6d193'
            'f498868b632b1365f4f452ffab1926baccf137374e7ab3cd9c21505ca3b142c3'
            '40add7951e84ba495675f9352910d9d91c1841658921e7612b4e9c47610bb607'
            '607429a755fc96caea339ace1cbb7d53f5b92c8566804e9aa15c2fdaff5f151c'
            '09b964994abb65fa5c0ed1b808140f0cfa34a0edbdfa1771382ad0481c289fe6'
            'ba75167fff469b3201d158472d54429eda9f41fea5f9029e17391490440d4a72'
            'c7e35752d9fb9dd9aa4cab52d4b96b136ae18dd52dbd730463fa28b823c95e5a'
            '4bd221782f657dcab738c62a80f84b6f601529a27f0c7f0755a2be3fef1291d4'
            'cfbd157f8da48cd125611a02cfa83b2912c20533fadf18db524171c13b799625'
            'd5395e3cde509e61d0e2115e6acc47c4f2597f0a1949e2912a1ae50d4c850188'
            'c71b3a428e06666a46b22b593ee6c16bfdbb2bcb29497985d9664f6a75231360'
            'e33cec9111703ba74796da99ecaa39b105b23421ebf575c849cca661bc91dc5f'
            '9164b14104855303387b645c18ba55f2c8c57cecc2907f7d6a91511a6fbabcf4')

prepare() {
  cd "${srcdir}/${_origname}"

  # Apply Arch Linux patches
  patch -Np1 -i '../0001-Label-Xorg-server-binary-correctly-on-Arch-Linux.patch'
  patch -Np1 -i '../0002-Label-OpenSSH-files-correctly-on-Arch-Linux.patch'
  patch -Np1 -i '../0003-Label-OpenSSH-systemd-unit-files.patch'
  patch -Np1 -i '../0004-Label-some-user-session-DBus-services-as-bin_t.patch'
  patch -Np1 -i '../0005-Allow-umount-to-atomically-write-run-mount-utab.patch'
  patch -Np1 -i '../0006-Allow-the-kernel-to-unlink-block-devices.patch'
  patch -Np1 -i '../0007-Label-gedit-plugins-properly-on-Arch-Linux.patch'
  patch -Np1 -i '../0008-Add-file-contexts-for-usr-bin-lib-sbin-when-they-exi.patch'
  patch -Np1 -i '../0009-Add-file-context-substitutions-for-systemd.patch'
  patch -Np1 -i '../0010-Rename-sbin-and-usr-sbin-directories-usr-s-bin.patch'
  patch -Np1 -i '../0011-Rename-usr-sbin-to-usr-s-bin-in-contrib-modules.patch'
  patch -Np1 -i '../0012-Customize-build.conf-for-Arch-Linux.patch'
  patch -Np1 -i '../0013-Allow-using-sys-fs-cgroup-symlinks.patch'
  patch -Np1 -i '../0014-Label-some-unit-files-in-contrib-modules.patch'
  patch -Np1 -i '../0015-Add-an-interface-for-systemd-daemons-to-configure-lo.patch'
  patch -Np1 -i '../0016-Add-systemd-backlight-policy.patch'
  patch -Np1 -i '../0017-Add-systemd-binfmt-policy.patch'
  patch -Np1 -i '../0018-Make-fs_register_binary_executable_type-interface-al.patch'
  patch -Np1 -i '../0019-systemd-timedated-and-systemd-timesyncd-policies.patch'
  patch -Np1 -i '../0020-Add-systemd-modules-load-policy.patch'
  patch -Np1 -i '../0021-Add-systemd-rfkill-policy.patch'

  make bare
  make conf
}

build() {
  cd "${srcdir}/${_origname}"
  make
}

package(){
  cd "${srcdir}/${_origname}"
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-headers
  make DESTDIR="${pkgdir}" PKGNAME="${_policyname}" install-docs

  # Create /var/lib/selinux, which is necessary for loading policy,
  # which is done via install script.
  install -d -m0755 "${pkgdir}/var/lib/selinux"

  # Install main SELinux config file defaulting to refpolicy
  install -m644 -D "${srcdir}/config" "${pkgdir}/etc/selinux/config"
}
