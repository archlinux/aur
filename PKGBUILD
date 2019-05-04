# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com>

pkgbase=archisomydrive
pkgname=$pkgbase
pkgver=1.1
pkgrel=1
_remotepkgbase=$pkgbase-git
_remotepkgver=1.1
_remotepkgrel=1
_gitname=ArchIsoMyDrive
_gittag="v${pkgver}"
pkgdesc="GUI utility to copy an ISO file to a USB disk."
arch=('x86_64')
url="https://github.com/daltomi/$_gitname"
license=('GPL3')
depends=('gtk2' 'udev' 'polkit' 'glibc')

source=("$url/raw/master/Install/$_remotepkgbase-$_remotepkgver-$_remotepkgrel-x86_64.pkg.tar.xz"{,.sig})


sha256sums=('a6559947c3b4eb2ac79cf88e4e445113b15caf58400fac695bec7b95eac97743'
            'SKIP'
           )

validpgpkeys=('51479755D90A2AACFA90A6551DD242462908D08B')

package() {
        install -Dm644 "$srcdir/usr/share/applications/archisomydrv.desktop" "$pkgdir/usr/share/applications/archisomydrv.desktop"
        install -Dm644 "$srcdir/usr/share/polkit-1/actions/org.archisomydrv.policy" "$pkgdir/usr/share/polkit-1/actions/org.archisomydrv.policy"
        install -Dm755 "$srcdir/usr/bin/archisomydrv" "$pkgdir/usr/bin/archisomydrv"
        install -Dm644 "$srcdir/usr/share/pixmaps/archisomydrv.png" "$pkgdir/usr/share/pixmaps/archisomydrv.png"
        install -Dt "$pkgdir/usr/share/ArchIsoMyDrive/" "$srcdir/usr/share/ArchIsoMyDrive/LICENSE"
        install -Dt "$pkgdir/usr/share/ArchIsoMyDrive/locale/" -m644 "$srcdir/usr/share/ArchIsoMyDrive/locale/"*
}

#  vim: set ts=8 sw=8 tw=500 et :
