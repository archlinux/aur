# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com>

pkgbase=archisomydrive
pkgname=$pkgbase
pkgver=1.0
pkgrel=1
_gitname=ArchIsoMyDrive
_gittag="v${pkgver}"
pkgdesc="Copy an ISO file to a USB drive."
arch=('x86_64')
url="https://github.com/daltomi/$_gitname"
license=('GPL3')
depends=('gtk2' 'udev')

source=("$url/raw/master/Install/archisomydrive-bin-$pkgver-$pkgrel-x86_64.pkg.tar.xz")

sha256sums=('535622a314285153713ee2c70e610b786026b4f44b57c7f6b82aa32d1a43783f')


package() {
        install -Dm644 "$srcdir/usr/share/applications/archisomydrv.desktop" "$pkgdir/usr/share/applications/archisomydrv.desktop"
        install -Dm644 "$srcdir/usr/share/polkit-1/actions/org.archisomydrv.policy" "$pkgdir/usr/share/polkit-1/actions/org.archisomydrv.policy"
        install -Dm755 "$srcdir/usr/bin/archisomydrv" "$pkgdir/usr/bin/archisomydrv"
        install -Dm644 "$srcdir/usr/share/pixmaps/archisomydrv.png" "$pkgdir/usr/share/pixmaps/archisomydrv.png"
        install -Dt "$pkgdir/usr/share/ArchIsoMyDrive/" "$srcdir/usr/share/ArchIsoMyDrive/LICENSE"
        install -Dt "$pkgdir/usr/share/ArchIsoMyDrive/locale/" -m644 "$srcdir/usr/share/ArchIsoMyDrive/locale/"*
}

#  vim: set ts=8 sw=8 tw=500 et :
