pkgname=watchit
_pkgver=1.0.0-beta.0
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Watch movies everywhere"
arch=('x86_64')
url="http://watchitapp.site"
license=('LGPL3')
depends=('libxss' 'nss' 'gtk3')
source=("https://github.com/ZorrillosDev/watchit-desktop/releases/download/v$_pkgver/${pkgname%-bin}_${_pkgver}_amd64.deb")
sha256sums=('ea7763256bda3b3805f1024130db7d53f4a23e82121b384af02333e99054aef8')
sha512sums=('fa54672278dbee172a09b23bf8e696847ba0b9d4b2dc11cead5460d66e726f335dbf32ddd15a4f3baa4e8fbb9bbb84b62de04fef94f4282d06aa27e14447d429')
b2sums=('415a7528859b5ffc56b5e7e333978d6723bf315e114076195f474a216039e5899427835b5449506f16dd0b673c01fc6f1ef23d1f8792d0dcdf0ca9c7b4bd7738')

package() {
    bsdtar xvf data.tar.xz -C "$pkgdir"
 
    install -d "$pkgdir/usr/bin"
    ln -sf "/opt/watchit/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
 
   # install -d "$pkgdir/usr/share/pixmaps"
    #mv "$pkgdir/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" \
   #     "$pkgdir/usr/share/pixmaps"
    #rm -rf "$pkgdir/usr/share/icons"
    #rm -rf "$pkgdir/usr/share/doc"
}

