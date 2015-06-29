# Maintainer: divansantana <divan _at_ santanas _dot_ co  za>
# Perl script to backup qemu machines

_gitname=virt-backup
pkgname=virt-backup-git
pkgver=20120419.9
pkgrel=2
pkgdesc='Perl script to backup qemu machines'
arch=('i686' 'x86_64')
url='https://github.com/syndicut/virt-backup'
license=('GPLv2')
depends=('perl-sys-virt' 'perl-xml-simple' 'libvirt' 'qemu')
optdepends=('lvm2: for LVM snapshots')
makedepends=('git')
source=(git://github.com/syndicut/virt-backup)
md5sums=(SKIP)

pkgver() {
   cd "$srcdir/$_gitname"
   echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm755 virt-backup.pl "$pkgdir/usr/bin/$_gitname"
    install -Dm644 README "$pkgdir/usr/share/$_gitname/README"
}

# vim: set ts=8 sw=3 tw=0 :

