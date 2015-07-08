# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
pkgname=justbrowsing-archiso
pkgver=2014.08
pkgrel=1
pkgdesc="ArchISO boot files for JustBrowsing LiveCD"
arch=('any')
url="https://github.com/justbrowsing/justbrowsing-archiso"
license=('custom')
depends=('justbrowsing-syslinux')
options=('!strip')
groups=("justbrowsing")
source=("https://github.com/justbrowsing/${pkgname}/archive/master.tar.gz")
install="jb-archiso.install"
md5sums=('8e7a7aa0472c6b14e57c8ee4620ab12e')
 
package() {
  cd "$srcdir/${pkgname}-master"

  # Store directory
  livecd="livecd"
  mkdir -p $pkgdir/${livecd}

  # /arch
  mkdir -p $pkgdir/${livecd}/arch/any
  mkdir -p $pkgdir/${livecd}/arch/boot/{i686,x86_64}
  install -m644 arch/aitab $pkgdir/${livecd}/arch/
  install -m644 arch/flavor.jb $pkgdir/${livecd}/arch/

  # /[BOOT]
  mkdir -p $pkgdir/${livecd}/\[BOOT\]/
  install -m644 \[BOOT\]/* $pkgdir/${livecd}/\[BOOT\]/

  # /EFI
  mkdir -p $pkgdir/${livecd}/EFI/{archiso,boot}
  install -m644 EFI/*.efi $pkgdir/${livecd}/EFI/
  install -m644 EFI/archiso/* $pkgdir/${livecd}/EFI/archiso/
  install -m644 EFI/boot/* $pkgdir/${livecd}/EFI/boot/

  # /isolinux
  mkdir -p $pkgdir/${livecd}/isolinux
  install -m644 isolinux/* $pkgdir/${livecd}/isolinux/

  # /loader
  mkdir -p $pkgdir/${livecd}/loader/entries
  install -m644 loader/*.conf $pkgdir/${livecd}/loader/
  install -m644 loader/entries/* $pkgdir/${livecd}/loader/entries/
}
