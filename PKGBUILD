# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr
pkgver=2.4.0
pkgrel=13
pkgdesc="'open' digital satellite receiver and timer controlled video disk recorder"
url="http://tvdr.de/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('fontconfig' 'libcap' 'libjpeg-turbo' 'libsystemd' 'perl' 'ttf-font')
makedepends=('systemd') #libsystemd should be enough but the pkg-config file is missing in the libsystemd package
optdepends=('lirc-utils: remote control support'
            'ncurses: skincurses plugin'
            'vdr-xorg: To start X11')
replaces=('runvdr-extreme')
conflicts=('runvdr-extreme')
provides=("vdr-api=2.4.0")
install='vdr.install'
_patches=('vdr-2.4.0-01-fix-svdrp-modt-recflag.diff'
          'vdr-2.4.0-02-fix-invalid-locking-sequence.diff'
          'vdr-2.4.0-03-fix-locking-channel-display.diff'
          'vdr-2.4.0-04-fix-locking-channel-display-2.diff'
          'vdr-2.4.0-05-fix-shutdown.diff'
          'vdr-2.4.0-06-fix-channel-switch.diff'
          'vdr-2.4.0-07-fix-disabling-mtd.diff'
          'vdr-2.4.0-08-add-multi-frontend-support.diff'
          'vdr-2.4.0-09-fix-multi-frontend-access.diff'
          'vdr-2.4.0-10-fix-missing-epg.diff'
          'vdr-2.4.0-11-fix-peerdemo-udp-port.diff'
          'vdr-2.4.0-12-fix-empty-pat.diff'
          'vdr-2.4.0-13-fix-shutdown-2.diff'
          'vdr-2.4.0-14-fix-eitscan.diff'
          'vdr-2.4.0-15-fix-skincurses.diff'
          'vdr-2.4.0-16-fix-nit-transponder-processing.diff'
          'vdr-2.4.0-17-fix-nit-sdt-trigger.diff'
          'vdr-2.4.0-19-add-eac3-from-other-sources.diff'
          'vdr-2.4.0-20-fix-logging-inactive-transponders.diff'
          'vdr-2.4.0-21-fix-libsi.diff'
          'vdr-2.4.0-22-fix-sort-recordings.diff'
          'vdr-2.4.0-23-fix-patch-16.diff'
          'vdr-2.4.0-24-fix-drop-caps.diff'
          'vdr-2.4.0-25-fix-channels-menu.diff'
          'vdr-2.4.0-26-fix-shared-ca-pids.diff'
          'vdr-2.4.0-27-fix-mtd-map-sid.diff'
          'vdr-2.4.0-28-fix-mtd-checksum.diff'
          'vdr-2.4.0-29-fix-compiler-warning.diff'
          'vdr-2.4.0-30-fix-ci-sendanswer.diff'
          'vdr-2.4.0-31-fix-invalid-lock-sequence.diff'
          'vdr-2.4.0-32-fix-remote-timers-lstt-550.diff'
          'vdr-2.4.0-33-fix-compiler-warning-add-attr-packed.diff'
          'vdr-2.4.0-34-fix-repeat-kbd.diff'
          'vdr-2.4.0-35-add-workaround-rst.diff'
          'vdr-2.4.0-36-fix-assert-free-disk-space.diff'
          'vdr-2.4.0-37-chg-max-pixmap-size.diff'
          'vdr-2.4.0-38-chg-playerbufsize.diff'
          'vdr-2.4.0-39-fix-card-index-vs-device-number.diff'
          'vdr-2.4.0-40-fix-wrong-variable-name.diff'
          'vdr-2.4.0-41-chg-skins-message-to-queue.diff'
          'vdr-2.4.0-42-fix-nit-dvbs2-backwards-compatibility-mode.diff')
source=("ftp://ftp.tvdr.de/vdr/${pkgname}-${pkgver}.tar.bz2"
        "${_patches[@]/#/ftp://ftp.tvdr.de/vdr/Developer/Patches/vdr-2.4/}"
        'MainMenuHooks-v1_0_2.diff::https://www.vdr-portal.de/index.php?attachment/30330'
        '00-vdr.conf' '50-hello.conf' '50-pictures.conf'
        '60-create-dvb-device-units.rules'
        'gen-sddropin'
        'shutdown.sh'
        'shutdown-wrapper.c'
        'vdr.service'
        'vdr.sysuser')
backup=("etc/vdr/conf.avail/"50-{epgtableid0,hello,osddemo,pictures,skincurses,status,svdrpdemo}.conf
        "etc/vdr/conf.avail/"50-svc{cli,svr}.conf
        'etc/vdr/conf.d/00-vdr.conf'
        'var/lib/vdr/camresponses.conf'
        'var/lib/vdr/channels.conf'
        'var/lib/vdr/diseqc.conf'
        'var/lib/vdr/keymacros.conf'
        'var/lib/vdr/scr.conf'
        'var/lib/vdr/sources.conf'
        'var/lib/vdr/svdrphosts.conf')
md5sums=('12c6a3abeadfa915fcfe736bb047a3ab'
         'b2f115b72cc98a031cecd00ab085a658'
         'd6df719874fbc276451db111d6393acb'
         '7dc852d13089880911e0ffe15308c21d'
         'a0bb1d3e8fe3a864f138ba7e84798e43'
         '881cf6a109d531800c6d48bca1ef4a7c'
         'e1a54547146639366512552311bd9df0'
         'f455271c9518498bffd2d1840a102868'
         '42b62c26e24fe5fb36c357f84a2763f7'
         'c2fccfb33bb0f6fe4629d278d6f026a6'
         'e0c439786644a346b0efe564be071f60'
         'a3d502710a361f9fe8916816be0d0c1b'
         'c7b7874238ca29fcafb9f6c0a6ff6505'
         '145a59b3c8e7330921d3c3c584218783'
         'bcc7c9e7a69ea0876ab72e3b111e07f1'
         '5e6f5d331cdd0d1a7ae006640876f6cc'
         '00fe7bf44ae9f3e54f24f12460196de9'
         'cc93aba56562643f2b0ac551ac981af8'
         '593c0ecd28748467e181f4e2a84929f6'
         '8c164c58e529372f36058539f14a7cc2'
         'b2721133ab1558698f2f86c700071a1d'
         '6ea776a90ffb0fa0f3e642e7f3a77196'
         '3784ba9107f82a580fca06b6c12cfd66'
         '36e8e34dbd55cc9994c7ebb57b5cbce6'
         '168fca065cbff6237575d3a35842e35d'
         '181f845e4fe0b855449960e920091ce0'
         '3f2f5d1eced0dd5ae6521e677892b06a'
         '637437b35a9383d4659256c03cbe560b'
         '923d11dba8d3beff1023cd3722e5b9a6'
         '44204391b4526fbc210a21434764ac9b'
         '68853b503fe1d9f62074f823db71a4bf'
         '330f3382d91a66aa90f6ce98dc16fac5'
         'd9fbd48e5ad651623966304f168ef902'
         '5381fd44dccd75cb67d248a2e514ef5a'
         '9672cf0df47f1dc376acf4a08daec77e'
         '4c85e400104313ee56daa60b71b2228f'
         'a64c0f0f4484411150da828bca9e0c82'
         '97fb7ca598ac649d04f174e77540e3d9'
         '2b3431dcf3793f5a194a36d6c46ce401'
         'cce4b6d4de6db679b59ffb22cbdf15f0'
         '79327528572382a58d01f7c8017e3034'
         'e2511a1e8414b2f75cb401632201a10f'
         '301c9b9766ed5182b07f1debc79abc21'
         'de3dcdea1a4282211c6dac370019548b'
         'fc450f75037b8712673db4969a1dd758'
         'f00583e3f5507b0ff935b4d5919e7df2'
         '23d6e1ca0a36cfdbd35d3b1a61f0a105'
         '3565ca5ad9be5c75f66478f0796b120d'
         'dd20f932b846b5f50ac455b65e9432ad'
         '7cad811b4ac5ee6c0b5496d006f1e0ee'
         '6c021358f299dca9ef7bbeb163312690'
         '59ce04d1d01bf92bf6cfc0b74223191c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo 'CFLAGS      += -O3' > Make.config
  echo 'CXXFLAGS    += -O3' >> Make.config
  echo 'PREFIX       = /usr' >> Make.config
  echo 'LIBDIR       = /usr/lib/vdr/plugins' >> Make.config
  echo 'VDR_USER     = vdr' >> Make.config
  echo 'SDNOTIFY     = 1' >> Make.config
  echo 'LIRC_DEVICE  = /run/lirc/lircd' >> Make.config

  # Upstream fixes
  for patch in "${_patches[@]}"; do
    patch -p0 -i "$srcdir/$patch"
  done

  # Custom extensions
  sed -i 's/NULL, 0, true/NULL, 0, OpenSubMenus/g' "$srcdir/MainMenuHooks-v1_0_2.diff"
  patch -p1 -i "$srcdir/MainMenuHooks-v1_0_2.diff"
}

build() {
  gcc -o shutdown-wrapper shutdown-wrapper.c

  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  for i in hello pictures; do
    install -Dm644 50-$i.conf "$pkgdir/etc/vdr/conf.avail/50-$i.conf"
  done

  install -Dm644 00-vdr.conf "$pkgdir/etc/vdr/conf.d/00-vdr.conf"
  install -Dm644 60-create-dvb-device-units.rules "$pkgdir/usr/lib/udev/rules.d/60-create-dvb-device-units.rules"
  install -Dm644 vdr.service "$pkgdir/usr/lib/systemd/system/vdr.service"

  install -Dm754 shutdown-wrapper "$pkgdir/usr/lib/vdr/bin/shutdown-wrapper"
  chgrp 666 "$pkgdir/usr/lib/vdr/bin/shutdown-wrapper"
  chmod u+s "$pkgdir/usr/lib/vdr/bin/shutdown-wrapper"

  install -Dm755 gen-sddropin "$pkgdir/usr/bin/vdr-gensddropin"
  install -Dm755 shutdown.sh "$pkgdir/usr/lib/vdr/bin/shutdown.sh"

  #Install sysuser config
  install -Dm644 ${srcdir}/$pkgname.sysuser "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  for i in epgtableid0 osddemo skincurses status svc{cli,svr} svdrpdemo; do
    echo "[$i]" > "$pkgdir/etc/vdr/conf.avail/50-$i.conf"
  done

  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "$pkgdir/var/lib/vdr"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/usr/share/vdr/shutdown-hooks"

  chown -R 666:666 "$pkgdir/srv/vdr"
  chown -R 666:666 "$pkgdir/var/cache/vdr"
  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
