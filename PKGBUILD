# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=mintstick
pkgver=1.6.4
pkgrel=1
pkgdesc="A graphical tool that allows you to format USB sticks and create bootable USB sticks."
arch=('any')
url="https://github.com/linuxmint/mintstick"
_url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=(GPL)
depends=(
    'coreutils'
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
    'python-dbus'
    'python-gobject'
    'python-pyparted'
    'python-xapp'
    'python-unidecode'
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
source=("${pkgname}-${pkgver}.tar.xz::${_url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('d82f1ccc02499a55f0fdc0b2b042bcbb0d194acb161456080608ca1dbc863c9e')

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
