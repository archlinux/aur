# Maintainer: zoe <chp321 AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>


pkgname=arch-backup
pkgver=0.8.11
pkgrel=3
pkgdesc="trivial backup scripts (ssh/smb support)"
arch=(any)
url="https://github.com/p5n/archlinux-stuff/tree/master/arch-backup"
license=("GPL")
makedepends=('git')
depends=()
backup=(etc/arch-backup/arch-backup.conf)
source=("${pkgname}.git::git+https://github.com/p5n/archlinux-stuff.git")
md5sums=(SKIP)

package() {
  mkdir -p ${pkgdir}/etc/arch-backup
  mkdir -p ${pkgdir}/usr/lib/arch-backup
  mkdir -p $pkgdir/usr/share/doc/arch-backup
  install -D -m 0644 ${srcdir}/${pkgname}.git/arch-backup/arch-backup.conf \
		     $pkgdir/etc/arch-backup/arch-backup.conf
  install -D -m 0755 ${srcdir}/${pkgname}.git/arch-backup/arch-backup.sh \
		     $pkgdir/usr/bin/arch-backup
  install -D -m 0755 ${srcdir}/${pkgname}.git/arch-backup/ssh-backup.sh \
		     $pkgdir/usr/lib/arch-backup/ssh
  install -D -m 0755 ${srcdir}/${pkgname}.git/arch-backup/smb-backup.sh \
		     $pkgdir/usr/lib/arch-backup/smb
  install -D -m 0755 ${srcdir}/${pkgname}.git/arch-backup/local-backup.sh \
		     $pkgdir/usr/lib/arch-backup/local
  install -D -m 0755 ${srcdir}/${pkgname}.git/arch-backup/common.inc \
		     $pkgdir/usr/lib/arch-backup/
  install -D -m 0644 ${srcdir}/${pkgname}.git/arch-backup/local-example.conf \
		     $pkgdir/etc/arch-backup/_local-example
  install -D -m 0644 ${srcdir}/${pkgname}.git/arch-backup/ssh-example.conf \
		     $pkgdir/etc/arch-backup/_ssh-example
  install -D -m 0644 ${srcdir}/${pkgname}.git/arch-backup/smb-example.conf \
		     $pkgdir/etc/arch-backup/_smb-example
  install -D -m 0644 ${srcdir}/${pkgname}.git/arch-backup/arch-backup.man.txt \
		     $pkgdir/usr/share/doc/arch-backup/arch-backup.man.txt
}
