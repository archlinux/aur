# Maintainer: r58Playz <r58Playz@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>

pkgbase=systemd-chromiumos
_pkgbase=systemd
pkgname=('systemd-chromiumos'
         'systemd-chromiumos-libs'
         'systemd-chromiumos-resolvconf'
         'systemd-chromiumos-sysvcompat'
         'systemd-chromiumos-ukify')
_tag='be88ad03366b8aa059bb72b39a270128ba62b428' # git rev-parse v${_tag_name}
_tag_name=255.2
pkgver="${_tag_name/-/}"
pkgrel=2
arch=('x86_64')
url='https://www.github.com/systemd/systemd'
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gperf' 'lz4' 'xz' 'pam' 'libelf'
             'intltool' 'iptables' 'kmod' 'libcap' 'libidn2' 'libgcrypt'
             'libmicrohttpd' 'libxcrypt' 'libxslt' 'util-linux' 'linux-api-headers'
             'python-jinja' 'python-lxml' 'quota-tools' 'shadow' 'git'
             'meson' 'libseccomp' 'pcre2' 'audit' 'kexec-tools' 'libxkbcommon'
             'bash-completion' 'p11-kit' 'systemd' 'libfido2' 'tpm2-tss' 'rsync'
             'bpf' 'libbpf' 'clang' 'llvm' 'curl' 'gnutls' 'python-pyelftools'
             'libpwquality' 'qrencode' 'lib32-gcc-libs')
checkdepends=('python-pefile')
options=('strip')
validpgpkeys=('63CDA1E5D3FC22B998D20DD6327F26951A015CC4'  # Lennart Poettering <lennart@poettering.net>
              'A9EA9081724FFAE0484C35A1A81CEA22BC8C7E2E'  # Luca Boccassi <luca.boccassi@gmail.com>
              '9A774DB5DB996C154EBBFBFDA0099A18E29326E1'  # Yu Watanabe <watanabe.yu+github@gmail.com>
              '5C251B5FC54EB2F80F407AAAC54CA336CFEB557E') # Zbigniew Jędrzejewski-Szmek <zbyszek@in.waw.pl>
source=("git+https://github.com/systemd/systemd-stable#tag=${_tag}?signed"
        "git+https://github.com/systemd/systemd#tag=v${_tag_name%.*}?signed"
        '0001-Use-Arch-Linux-device-access-groups.patch'
        '0002-Disable-mount_nofollow-for-ChromiumOS-kernels.patch'
        # mkinitcpio files
        'initcpio-hook-udev'
        'initcpio-install-systemd'
        'initcpio-install-udev'
        # bootloader files
        'arch.conf'
        'loader.conf'
        'splash-arch.bmp'
        # pam configuration
        'systemd-user.pam'
        # pacman / libalpm hooks
        'systemd-hook'
        '20-systemd-sysusers.hook'
        '30-systemd-binfmt.hook'
        '30-systemd-catalog.hook'
        '30-systemd-daemon-reload-system.hook'
        '30-systemd-daemon-reload-user.hook'
        '30-systemd-hwdb.hook'
        '30-systemd-sysctl.hook'
        '30-systemd-tmpfiles.hook'
        '30-systemd-udev-reload.hook'
        '30-systemd-update.hook')
sha512sums=('SKIP'
            'SKIP'
            '3ccf783c28f7a1c857120abac4002ca91ae1f92205dcd5a84aff515d57e706a3f9240d75a0a67cff5085716885e06e62597baa86897f298662ec36a940cf410e'
            '14279a57ec414dc68c25d9e0fd688c94cd078143bf144ac9081ffaa1e369527f3f04369fc27a88c03ae15cc879ac9678c38ca4c7ebfc1d7cbb40a2c2941266d1'
            '4a6cd0cf6764863985dc5ad774d7c93b574645a05b3295f989342951d43c71696d069641592e37eeadb6d6f0531576de96b6392224452f15cd9f056fae038f8e'
            'ada692514d758fa11e2be6b4c5e1dc2d9d47548f24ada35afdce1dcac918e72ae2251c892773e6cf41fa431c3613a1608668e999eb86a565870fecb55c47b4ba'
            'a8c7e4a2cc9c9987e3c957a1fc3afe8281f2281fffd2e890913dcf00cf704024fb80d86cb75f9314b99b0e03bac275b22de93307bfc226d8be9435497e95b7e6'
            '61032d29241b74a0f28446f8cf1be0e8ec46d0847a61dadb2a4f096e8686d5f57fe5c72bcf386003f6520bc4b5856c32d63bf3efe7eb0bc0deefc9f68159e648'
            'c416e2121df83067376bcaacb58c05b01990f4614ad9de657d74b6da3efa441af251d13bf21e3f0f71ddcb4c9ea658b81da3d915667dc5c309c87ec32a1cb5a5'
            '5a1d78b5170da5abe3d18fdf9f2c3a4d78f15ba7d1ee9ec2708c4c9c2e28973469bc19386f70b3cf32ffafbe4fcc4303e5ebbd6d5187a1df3314ae0965b25e75'
            'b90c99d768dc2a4f020ba854edf45ccf1b86a09d2f66e475de21fe589ff7e32c33ef4aa0876d7f1864491488fd7edb2682fc0d68e83a6d4890a0778dc2d6fe19'
            '3cb8f88c1bffc753d0c540be5d25a0fdb9224478cca64743b5663340f2f26b197775286e6e680228db54c614dcd11da1135e625674a622127681662bec4fa886'
            '299dcc7094ce53474521356647bdd2fb069731c08d14a872a425412fcd72da840727a23664b12d95465bf313e8e8297da31259508d1c62cc2dcea596160e21c5'
            '0d6bc3d928cfafe4e4e0bc04dbb95c5d2b078573e4f9e0576e7f53a8fab08a7077202f575d74a3960248c4904b5f7f0661bf17dbe163c524ab51dd30e3cb80f7'
            '2b50b25e8680878f7974fa9d519df7e141ca11c4bfe84a92a5d01bb193f034b1726ea05b3c0030bad1fbda8dbb78bf1dc7b73859053581b55ba813c39b27d9dc'
            'a436d3f5126c6c0d6b58c6865e7bd38dbfbfb7babe017eeecb5e9d162c21902cbf4e0a68cf3ac2f99815106f9fa003b075bd2b4eb5d16333fa913df6e2f3e32a'
            'bb7765e4c4f72ff51b9c24a36ace3ac43a7c7cf35c78ca44aac461fb099dfd7aa19bb49388ed68437e14b451c01f07a4be7994edc10871ef4dd4abbb31cfa257'
            'a1661ab946c6cd7d3c6251a2a9fd68afe231db58ce33c92c42594aedb5629be8f299ba08a34713327b373a3badd1554a150343d8d3e5dfb102999c281bd49154'
            '9426829605bbb9e65002437e02ed54e35c20fdf94706770a3dc1049da634147906d6b98bf7f5e7516c84068396a12c6feaf72f92b51bdf19715e0f64620319de'
            'da7a97d5d3701c70dd5388b0440da39006ee4991ce174777931fea2aa8c90846a622b2b911f02ae4d5fffb92680d9a7e211c308f0f99c04896278e2ee0d9a4dc'
            'a50d202a9c2e91a4450b45c227b295e1840cc99a5e545715d69c8af789ea3dd95a03a30f050d52855cabdc9183d4688c1b534eaa755ebe93616f9d192a855ee3'
            '825b9dd0167c072ba62cabe0677e7cd20f2b4b850328022540f122689d8b25315005fa98ce867cf6e7460b2b26df16b88bb3b5c9ebf721746dce4e2271af7b97')

_backports=(
)

_reverts=(
)

prepare() {
  cd "$_pkgbase-stable"

  # add upstream repository for cherry-picking
  git remote add -f upstream ../systemd

  local _c _l
  for _c in "${_backports[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git cherry-pick --mainline 1 --no-commit "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git revert --mainline 1 --no-commit "${_c}"
  done

  # Replace cdrom/dialout/tape groups with optical/uucp/storage
  patch -Np1 -i ../0001-Use-Arch-Linux-device-access-groups.patch
  patch -Np1 -i ../0002-Disable-mount_nofollow-for-ChromiumOS-kernels.patch
}

build() {
  local _timeservers=({0..3}.arch.pool.ntp.org)
  local _nameservers=(
    # We use these public name services, ordered by their privacy policy (hopefully):
    #  * Cloudflare (https://1.1.1.1/)
    #  * Quad9 (https://www.quad9.net/)
    #  * Google (https://developers.google.com/speed/public-dns/)
    '1.1.1.1#cloudflare-dns.com'
    '9.9.9.9#dns.quad9.net'
    '8.8.8.8#dns.google'
    '2606:4700:4700::1111#cloudflare-dns.com'
    '2620:fe::9#dns.quad9.net'
    '2001:4860:4860::8888#dns.google'
  )

  local _meson_options=(
    # internal version comparison is incompatible with pacman:
    #   249~rc1 < 249 < 249.1 < 249rc
    -Dversion-tag="${_tag_name/-/\~}-${pkgrel}-arch"
    -Dshared-lib-tag="${pkgver}-${pkgrel}"
    -Dmode=release

    -Dapparmor=false
    -Dbootloader=true
    -Dxenctrl=false
    -Dbpf-framework=true
    -Dima=false
    -Dlibidn2=true
    -Dlz4=true
    -Dman=true
    -Dnscd=false
    -Dselinux=false

    # We disable DNSSEC by default, it still causes trouble:
    # https://github.com/systemd/systemd/issues/10579

    -Ddbuspolicydir=/usr/share/dbus-1/system.d
    -Ddefault-dnssec=no
    -Ddefault-hierarchy=unified
    -Ddefault-kill-user-processes=false
    -Ddefault-locale='C.UTF-8'
    -Dlocalegen-path=/usr/bin/locale-gen
    -Ddns-over-tls=openssl
    -Dfallback-hostname='archlinux'
    -Dnologin-path=/usr/bin/nologin
    -Dntp-servers="${_timeservers[*]}"
    -Ddns-servers="${_nameservers[*]}"
    -Drpmmacrosdir=no
    -Dsysvinit-path=
    -Dsysvrcnd-path=

    -Dsbat-distro='arch'
    -Dsbat-distro-summary='Arch Linux'
    -Dsbat-distro-pkgname="${pkgname}"
    -Dsbat-distro-version="${pkgver}"
    -Dsbat-distro-url="https://aur.archlinux.org/packages/${pkgname}/"
  )

  # this uses malloc_usable_size, which is incompatible with fortification level 3
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  arch-meson "$_pkgbase-stable" build "${_meson_options[@]}"

  meson compile -C build
}

check() {
  meson test -C build
}

package_systemd-chromiumos() {
  pkgdesc='system and service manager - chromiumos patches'
  license=('GPL2' 'LGPL2.1')
  depends=('acl' 'libacl.so' 'bash' 'cryptsetup' 'libcryptsetup.so' 'dbus'
           'dbus-units' 'kbd' 'kmod' 'libkmod.so' 'hwdata' 'libcap' 'libcap.so'
           'libgcrypt' 'libxcrypt' 'libcrypt.so' 'systemd-libs' 'libidn2' 'lz4' 'pam'
           'libelf' 'libseccomp' 'libseccomp.so' 'util-linux' 'libblkid.so'
           'libmount.so' 'xz' 'pcre2' 'audit' 'libaudit.so'
           'openssl' 'libcrypto.so' 'libssl.so')
  provides=('nss-myhostname' "systemd-tools=$pkgver" "udev=$pkgver" "systemd=$pkgver")
  replaces=('nss-myhostname' 'systemd-tools' 'udev')
  conflicts=('nss-myhostname' 'systemd-tools' 'udev' 'systemd')
  optdepends=('libmicrohttpd: systemd-journal-gatewayd and systemd-journal-remote'
              'quota-tools: kernel-level quota management'
              'systemd-sysvcompat: symlink package to provide sysvinit binaries'
              'systemd-ukify: combine kernel and initrd into a signed Unified Kernel Image'
              'polkit: allow administration as unprivileged user'
              'curl: systemd-journal-upload, machinectl pull-tar and pull-raw'
              'gnutls: systemd-journal-gatewayd and systemd-journal-remote'
              'qrencode: show QR codes'
              'iptables: firewall features'
              'libbpf: support BPF programs'
              'libpwquality: check password quality'
              'libfido2: unlocking LUKS2 volumes with FIDO2 token'
              'libp11-kit: support PKCS#11'
              'tpm2-tss: unlocking LUKS2 volumes with TPM2')
  backup=(etc/pam.d/systemd-user
          etc/systemd/coredump.conf
          etc/systemd/homed.conf
          etc/systemd/journald.conf
          etc/systemd/journal-remote.conf
          etc/systemd/journal-upload.conf
          etc/systemd/logind.conf
          etc/systemd/networkd.conf
          etc/systemd/oomd.conf
          etc/systemd/pstore.conf
          etc/systemd/resolved.conf
          etc/systemd/sleep.conf
          etc/systemd/system.conf
          etc/systemd/timesyncd.conf
          etc/systemd/user.conf
          etc/udev/iocost.conf
          etc/udev/udev.conf)
  install=systemd.install

  meson install -C build --destdir "$pkgdir"

  # we'll create this on installation
  rmdir "$pkgdir"/var/log/journal/remote

  # runtime libraries shipped with systemd-libs
  install -d -m0755 systemd-libs/lib/
  mv "$pkgdir"/usr/lib/lib{nss,systemd,udev}*.so* systemd-libs/lib/
  mv "$pkgdir"/usr/lib/pkgconfig systemd-libs/lib/pkgconfig
  mv "$pkgdir"/usr/include systemd-libs/include
  mv "$pkgdir"/usr/share/man/man3 systemd-libs/man3

  # ukify shipped in separate package
  install -d -m0755 systemd-ukify/{bin,systemd,man1,install.d}
  mv "$pkgdir"/usr/bin/ukify systemd-ukify/bin/
  mv "$pkgdir"/usr/lib/systemd/ukify systemd-ukify/systemd/
  mv "$pkgdir"/usr/share/man/man1/ukify.1 systemd-ukify/man1/
  # we move the ukify hook itself, but keep 90-uki-copy.install in place,
  # because there are other ways to generate UKIs w/o ukify, e.g. w/ mkinitcpio
  mv "$pkgdir"/usr/lib/kernel/install.d/60-ukify.install systemd-ukify/install.d


  # manpages shipped with systemd-sysvcompat
  rm "$pkgdir"/usr/share/man/man8/{halt,poweroff,reboot,shutdown}.8

  # executable (symlinks) shipped with systemd-sysvcompat
  rm "$pkgdir"/usr/bin/{halt,init,poweroff,reboot,shutdown}

  # files shipped with systemd-resolvconf
  rm "$pkgdir"/usr/{bin/resolvconf,share/man/man1/resolvconf.1}

  # avoid a potential conflict with [core]/filesystem
  rm "$pkgdir"/usr/share/factory/etc/{issue,nsswitch.conf}
  sed -i -e '/^C \/etc\/nsswitch\.conf/d' \
    -e '/^C \/etc\/issue/d' "$pkgdir"/usr/lib/tmpfiles.d/etc.conf

  # ship default policy to leave services disabled
  echo 'disable *' >"$pkgdir"/usr/lib/systemd/system-preset/99-default.preset

  # add mkinitcpio hooks
  install -D -m0644 initcpio-install-systemd "$pkgdir"/usr/lib/initcpio/install/systemd
  install -D -m0644 initcpio-install-udev "$pkgdir"/usr/lib/initcpio/install/udev
  install -D -m0644 initcpio-hook-udev "$pkgdir"/usr/lib/initcpio/hooks/udev

  # The group 'systemd-journal' is allocated dynamically and may have varying
  # gid on different systems. Let's install with gid 0 (root), systemd-tmpfiles
  # will fix the permissions for us. (see /usr/lib/tmpfiles.d/systemd.conf)
  install -d -o root -g root -m 2755 "$pkgdir"/var/log/journal

  # match directory owner/group and mode from [extra]/polkit
  install -d -o root -g 102 -m 0750 "$pkgdir"/usr/share/polkit-1/rules.d

  # add example bootctl configuration
  install -D -m0644 arch.conf "$pkgdir"/usr/share/systemd/bootctl/arch.conf
  install -D -m0644 loader.conf "$pkgdir"/usr/share/systemd/bootctl/loader.conf
  install -D -m0644 splash-arch.bmp "$pkgdir"/usr/share/systemd/bootctl/splash-arch.bmp

  # pacman hooks
  install -D -m0755 systemd-hook "$pkgdir"/usr/share/libalpm/scripts/systemd-hook
  install -D -m0644 -t "$pkgdir"/usr/share/libalpm/hooks *.hook

  # overwrite the systemd-user PAM configuration with our own
  install -D -m0644 systemd-user.pam "$pkgdir"/etc/pam.d/systemd-user
}

package_systemd-chromiumos-libs() {
  pkgdesc='systemd client libraries - chromiumos patches'
  depends=('glibc' 'gcc-libs' 'libcap' 'libgcrypt' 'lz4' 'xz' 'zstd')
  license=('LGPL2.1')
  provides=('libsystemd' 'libsystemd.so' 'libudev.so' "systemd-libs=$pkgver")
  conflicts=('libsystemd' 'systemd-libs')
  replaces=('libsystemd')

  install -d -m0755 "$pkgdir"/usr/share/man
  mv systemd-libs/lib "$pkgdir"/usr/lib
  mv systemd-libs/include "$pkgdir"/usr/include
  mv systemd-libs/man3 "$pkgdir"/usr/share/man/man3
}

package_systemd-chromiumos-resolvconf() {
  pkgdesc='systemd resolvconf replacement (for use with systemd-resolved) - chromiumos patches'
  license=('LGPL2.1')
  depends=('systemd-chromiumos')
  provides=('openresolv' 'resolvconf' "systemd-resolvconf=$pkgver")
  conflicts=('resolvconf' 'systemd-resolvconf')

  install -d -m0755 "$pkgdir"/usr/bin
  ln -s resolvectl "$pkgdir"/usr/bin/resolvconf

  install -d -m0755 "$pkgdir"/usr/share/man/man1
  ln -s resolvectl.1.gz "$pkgdir"/usr/share/man/man1/resolvconf.1.gz
}

package_systemd-chromiumos-sysvcompat() {
  pkgdesc='sysvinit compat for systemd - chromiumos patches'
  license=('GPL2')
  provides=("systemd-sysvcompat=$pkgver")
  conflicts=('sysvinit' 'systemd-sysvcompat')
  depends=('systemd-chromiumos')

  install -D -m0644 -t "$pkgdir"/usr/share/man/man8 \
    build/man/{halt,poweroff,reboot,shutdown}.8

  install -d -m0755 "$pkgdir"/usr/bin
  ln -s ../lib/systemd/systemd "$pkgdir"/usr/bin/init
  for tool in halt poweroff reboot shutdown; do
    ln -s systemctl "$pkgdir"/usr/bin/$tool
  done
}

package_systemd-chromiumos-ukify() {
  pkgdesc='Combine kernel and initrd into a signed Unified Kernel Image - chromiumos patches'
  license=('GPL2')
  provides=('ukify' "systemd-ukify=$pkgver")
  conflicts=('systemd-ukify')
  depends=('binutils' 'python-cryptography' 'python-pefile' 'systemd-chromiumos')
  optdepends=('python-pillow: Show the size of splash image'
              'sbsigntools: Sign the embedded kernel')

  install -d -m0755 "$pkgdir"/usr/{lib/kernel,share/man}
  mv systemd-ukify/bin "$pkgdir"/usr/bin
  mv systemd-ukify/systemd "$pkgdir"/usr/lib/systemd
  mv systemd-ukify/man1 "$pkgdir"/usr/share/man/man1
  mv systemd-ukify/install.d "$pkgdir"/usr/lib/kernel/install.d
}

# vim:ft=sh syn=sh et sw=2:
