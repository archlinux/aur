# Maintainer: Morgan Adamiec <morganamilo@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Morten Linderud <foxboron@archlinux.org>

_pkgname=pacman
pkgname=pacman-git
pkgver=7.0.0.r116.g62d27a6e
pkgrel=1
pkgdesc="A library-based package manager with dependency support"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64' 'riscv64')
url="https://www.archlinux.org/pacman/"
license=('GPL-2.0-or-later')
depends=(
  bash
  coreutils
  curl libcurl.so
  gawk
  gettext
  glibc
  gnupg
  gpgme libgpgme.so
  grep
  libarchive libarchive.so
  openssl libcrypto.so
  pacman-mirrorlist
  systemd
)
makedepends=(
  asciidoc
  doxygen
  git
  meson
)
checkdepends=(
  fakechroot
  python
)
optdepends=(
  'base-devel: required to use makepkg'
  'perl-locale-gettext: translation support in makepkg-template'
)
conflicts=('pacman')
provides=('libalpm.so' "pacman=${pkgver%.*.*}")
backup=(etc/pacman.conf
        etc/makepkg.conf
        etc/makepkg.conf.d/fortran.conf
        etc/makepkg.conf.d/rust.conf)
source=("git+https://gitlab.archlinux.org/pacman/pacman.git"
        revertme-makepkg-remove-libdepends-and-libprovides.patch::https://gitlab.archlinux.org/pacman/pacman/-/commit/354a300cd26bb1c7e6551473596be5ecced921de.patch
        alpm.sysusers)
source_x86_64=({pacman,makepkg,fortran,rust}.conf.x86_64)
source_i686=(replace-i686-by-pentium4-when-architecture-is-auto.patch
             {pacman,makepkg,fortran,rust}.conf.i686)
source_i686=(replace-i686-by-pentium4-when-architecture-is-auto.patch
             {pacman,makepkg,fortran,rust}.conf.pentium4)
source_armv7h=(0001-Sychronize-filesystem.patch
               0002-Revert-close-stdin-before-running-install-scripts.patch
               0003-Revert-alpm_run_chroot-always-connect-parent2child-p.patch
               {pacman,makepkg,fortran,rust}.conf.armv7h)
source_aarch64=(0001-Sychronize-filesystem.patch
                0002-Revert-close-stdin-before-running-install-scripts.patch
                0003-Revert-alpm_run_chroot-always-connect-parent2child-p.patch
                {pacman,makepkg,fortran,rust}.conf.aarch64)
source_riscv64=({pacman,makepkg,fortran,rust}.conf.riscv64)
sha256sums=('SKIP'
            'b3bce9d662e189e8e49013b818f255d08494a57e13fc264625f852f087d3def2'
            'c8760d7ebb6c9817d508c691c67084be251cd9c8811ee1ccf92c1278bad74c1c')
sha256sums_i686=('6a7906bd28a57cbcff58d856ffefbbb9096a163aaff79913b4fac69d75d0028a'
                 '3e482ca4e98386679cec02b51e32c6a13caf3dee365a850567547f616a69408f'
                 'd07047048522f0ebcd241d112003ddc875e11e354b41374018964131ca857d23'
                 '4e7df5c9ed10d538e7c76e57049c1cfe377d922787168b316e80e8235579c11e'
                 '6fe03e6ea3f69d99d59a48847a8ae97c2160fca847c7aedf7b89d05e4aa9386d')
sha256sums_x86_64=('bc80e9d0439caddd29b99a69b5060b5589cad2398c23abc5b2b8b990fae6ad8c'
                   'd99c1f9608362fff9ab3a2ca0a3096a317927b42a6725bc86599da6849c9c67c'
                   '4e7df5c9ed10d538e7c76e57049c1cfe377d922787168b316e80e8235579c11e'
                   '6fe03e6ea3f69d99d59a48847a8ae97c2160fca847c7aedf7b89d05e4aa9386d')
sha256sums_armv7h=('bcfc2125568779f080501db8b5f4a97d4dddb02e058da7d222a05deb20defd71'
                   '412bd346899161c296804896d1ec2be582d84680ac5301350dabac43b9ab5891'
                   'afa98f6898dd8f144cd16928f60bb32202917a8ce91d84fefc9ac059284356a3'
                   '5eb13b0b69c59efeef63ed2d2dac35458f7ad4f9063b8d806a59d33122c232cb'
                   'dcccf16a818e028d301b13671e741e45f16fe77ddb52b73cb504c9bb585ed34b'
                   '4e7df5c9ed10d538e7c76e57049c1cfe377d922787168b316e80e8235579c11e'
                   '3d7579f4fa52ef512dc82187c010f273aa45e6e8349f8fda9839f808c7dae042')
sha256sums_aarch64=('bcfc2125568779f080501db8b5f4a97d4dddb02e058da7d222a05deb20defd71'
                    '412bd346899161c296804896d1ec2be582d84680ac5301350dabac43b9ab5891'
                    'afa98f6898dd8f144cd16928f60bb32202917a8ce91d84fefc9ac059284356a3'
                    '18b2b0ed1ae3c29841f5d20b2c764964f7917beb70ddf031a931ace152cff215'
                    'aeba2769f7da68cc6e2b8316627bdb177f015d369487a0c232611cac6e4b36c0'
                    '4e7df5c9ed10d538e7c76e57049c1cfe377d922787168b316e80e8235579c11e'
                    '3d7579f4fa52ef512dc82187c010f273aa45e6e8349f8fda9839f808c7dae042')
sha256sums_riscv64=('bc80e9d0439caddd29b99a69b5060b5589cad2398c23abc5b2b8b990fae6ad8c'
                    'ab2a1827b011b91a9df705d8bf6b1f39264e5a3c9c04dfb7993c19bf361887b0'
                    '4e7df5c9ed10d538e7c76e57049c1cfe377d922787168b316e80e8235579c11e'
                    '6fe03e6ea3f69d99d59a48847a8ae97c2160fca847c7aedf7b89d05e4aa9386d')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  (( PACMAN_GIT_PKGBUILD_NO_PATCH )) && return

  # handle patches
  local -a patches
  local source_arch="source_$CARCH[@]"
  patches=($(printf '%s\n' "${source[@]}" "${!source_arch}" "$" | grep '.patch'))
  patches=("${patches[@]%%::*}")
  patches=("${patches[@]##*/}")

  if (( ${#patches[@]} != 0 )); then
    for patch in "${patches[@]}"; do
      if [[ $patch =~ revertme-* ]]; then
        msg2 "Reverting patch $patch..."
        patch -RNp1 < "../$patch"
      else
        msg2 "Applying patch $patch..."
        patch -Np1 < "../$patch"
      fi
    done
  fi
}


build() {
  cd "$_pkgname"

  meson setup \
        --prefix=/usr \
        --buildtype=plain \
        -Ddoc=enabled \
        -Ddoxygen=enabled \
        -Duse-git-version=true \
        -Dscriptlet-shell=/usr/bin/bash \
        -Dldconfig=/usr/bin/ldconfig \
        build

  meson compile -C build
}

check() {
  cd "$_pkgname"

  meson test -C build
}

package() {
  cd "$_pkgname"

  DESTDIR="$pkgdir" meson install -C build

  # install Arch specific stuff
  install -dm755 "$pkgdir/etc"
  install -m644 "$srcdir/pacman.conf.$CARCH" "$pkgdir/etc/pacman.conf"
  install -m644 "$srcdir/makepkg.conf.$CARCH" "$pkgdir/etc/makepkg.conf"
  install -D -m644 "$srcdir/alpm.sysusers" "${pkgdir}"/usr/lib/sysusers.d/alpm.conf
  install -m644 "$srcdir/fortran.conf.$CARCH" "$pkgdir/etc/makepkg.conf.d/fortran.conf"
  install -m644 "$srcdir/rust.conf.$CARCH" "$pkgdir/etc/makepkg.conf.d/rust.conf"

  local wantsdir="$pkgdir/usr/lib/systemd/system/sockets.target.wants"
  install -dm755 "$wantsdir"

  local unit
  for unit in dirmngr gpg-agent gpg-agent-{browser,extra,ssh} keyboxd; do
    ln -s "../${unit}@.socket" "$wantsdir/${unit}@etc-pacman.d-gnupg.socket"
  done
}
