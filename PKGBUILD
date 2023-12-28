# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mintstick
pkgver=1.5.8
pkgrel=1
pkgdesc="A graphical tool that allows you to format USB sticks and create bootable USB sticks."
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=(GPL)
depends=(
    'coreutils'
    'dbus-python'
    'desktop-file-utils'
    'dosfstools'
    'e2fsprogs'
    'exfatprogs'
    'glib2'
    'gtk3'
    'ntfs-3g'
    'parted'
    'polkit'
    'procps-ng'
    'python'
    'python-gobject'
    'python-pyparted'
    'python-xapp'
    'udisks2'
    'util-linux'
    'xapp'
)
makedepends=(
    'gettext'
)
conflicts=(
    'mintstick-git'
)
source=("${pkgname}-${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('31ee484e7021d6f6b93fe7f5c399dfef9d2b8e9d762111af9c828cc8bf1b2fa9')

package() {
  cd "$pkgname"
  #install -Dm644 lib/* -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 lib/* -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 "share/$pkgname"/* -t "$pkgdir/usr/share/$pkgname/"
  install -Dm644 share/applications/* -t "$pkgdir/usr/share/applications/"
  install -Dm644 share/polkit/* -t "$pkgdir/usr/share/polkit-1/actions/"
  install -Dm755 "$pkgname" mint-iso-verify -t "$pkgdir/usr/bin/"
  install -Dm644 share/nemo/actions/* -t "$pkgdir/usr/share/nemo/actions/"
  install -Dm644 share/kde4/* -t "$pkgdir/usr/share/kde4/apps/solid/actions/"
  cp -r share/icons "$pkgdir/usr/share/icons"
  install -Dm755 bin/* -t "$pkgdir/usr/bin/"
  install -Dm644 "debian/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}
