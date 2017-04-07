pkgname=bearychat
_pkgname=BearyChat-linux-x64
pkgver=v2
pkgrel=1
pkgdesc="面向未来的团队工作方式，团队沟通与智能化工作流"
arch=('x86_64')
url="https://bearychat.com"
license=( 'custom')
depends=()
source=("https://dn-bearychat.qbox.me/v2/${_pkgname}.tar.gz"
        'license'
        'bearychat.sh'
        'bearychat.desktop'
        'bearychat.png'
        )

package() {
        cd "$srcdir"
        bsdtar -xf $_pkgname.tar.gz
        mkdir -p "$pkgdir/opt"
        mv "$_pkgname" "$pkgdir/opt/$pkgname"
        # license
        mkdir -p $pkgdir/usr/share/licenses/$pkgname
        install -Dm644 license $pkgdir/usr/share/licenses/$pkgname/

        install -Dm755 bearychat.sh "$pkgdir/usr/bin/bearychat"
        install -Dm644 bearychat.desktop "$pkgdir/usr/share/applications/bearychat.desktop"
        install -Dm644 bearychat.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/bearychat.png"
}

md5sums=('f8e2913b19416e6290a0685f37045af5'
         '3c4c6a04a297d45fab57cf2be1ea9e3c'
         '227cfd2422267cd99b7ead270d68fab9'
         'd1f4f8bfac5248333dc2eb5d7843a5ea'
         '631b150db79d00bc496e3359a79fd9ea')
