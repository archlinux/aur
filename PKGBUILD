#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>

pkgname="ureminder"
pkgver="0.8.1"
pkgrel="1"
pkgdesc="Remind user upgrade packages and keeps package cache clean"
arch=('any')
depends=('bash' 'curl' 'pup' 'systemd' 'libnotify' 'reflector' 'pacman-contrib')
makedepends=(git)
url="https://codeberg.org/tuxnix/$pkgname.git"
license=('GPL2-only')
install="$pkgname.install"
URL="git+https://codeberg.org/tuxnix/$pkgname/"
source=('$pkgname::$URL')
#source=('directory::sourceurl#fragment?query')
#sourceurl=git+https://....

package() {
    cd "$srcdir"
    install -Dm744 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.mo "$pkgdir/usr/share/locale/de_DE/LC_MESSAGES/$pkgname.mo"
    install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 $pkgname.timer "$pkgdir/usr/lib/systemd/system/$pkgname.timer"
    #install -Dm644 LicenseRef-FAFBL "$pkgdir/usr/share/licenses/$pkgname/LicenseRef-FAFBL"

}

sha512sums=('4624851500742a4e6e7036c6ac0f5400b93da122dcadfbdf1635e382f6ac14b874539f5c132aacdb02d702493fa22901e8e03905ec55ec9eda7e74359b4cd761'
            '2b43d27bbaeda6be8089a39fbdd3a036c538e960ec6d3de34e22be3c959caba72cc962412440ece68ae9e9dd4741096e61f0de6abf1492cfb486edbae33bff72'
            '78598a48854c8b01cda083340fbf7b6e9070e8abeb11ced97bebd824a217f35e7fc6c1ec959a41d8403aee306dab223595e0ceea6afb2b86894f396b36a5de37'
            '9363d167dc38281009650393a85881d1681b27b90c1421b9fbc67775a48b2be6bf2bbdebf3761bac52d4cb70309b682989d982e1eae818df3b107fbf101b255f')
